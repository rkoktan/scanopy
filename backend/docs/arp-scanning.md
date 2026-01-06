# ARP Scanning Implementation

## Overview

Scanopy uses broadcast ARP scanning for fast host discovery on local networks. This document explains our implementation, the network equipment constraints we work around, and the configuration options available to users.

## How ARP Scanning Works

When discovering hosts on a local network, we send ARP (Address Resolution Protocol) "who-has" requests to each target IP address. Hosts that are alive respond with ARP replies containing their MAC address. This is faster and more reliable than TCP/UDP probing for local network discovery because:

1. ARP operates at Layer 2 - hosts cannot firewall ARP requests and still communicate on the network
2. Broadcast ARP can scan thousands of IPs in seconds rather than minutes
3. We get MAC addresses for free, enabling better host identification

## The Rate Limiting Problem

### Network Equipment Constraints

Many enterprise switches implement **Dynamic ARP Inspection (DAI)** which rate-limits ARP packets to prevent ARP spoofing attacks. When the rate limit is exceeded, switches may:

- Drop excess ARP packets silently
- Place the port in **errdisable state** (Cisco) - effectively disconnecting the device
- Log security violations

**Known thresholds by vendor:**

| Vendor/Config | Default Rate Limit | Notes |
|---------------|-------------------|-------|
| Cisco (untrusted port) | 15 pps | Port goes to errdisable if exceeded |
| Cisco (trusted port) | Unlimited | Requires explicit configuration |
| Ruckus | ~100 pps | May vary by model |
| HPE/Aruba | Varies | Check switch documentation |
| Generic enterprise | 15-100 pps | Conservative assumption |

### The Impact

A naive ARP scanner sending at 1000 packets/second (1ms delay) would:
- Exceed Cisco's 15 pps limit by 66x
- Risk triggering port errdisable on managed switches
- Cause packet loss and missed hosts on rate-limited networks

**References:**
- [Cisco Catalyst Dynamic ARP Inspection](https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst3750/software/release/12-2_52_se/configuration/guide/3750scg/swdynarp.html)
- [Cisco Nexus Rate Limiting](https://www.cisco.com/c/en/us/td/docs/switches/datacenter/sw/6_x/nx-os/security/configuration/guide/b_Cisco_Nexus_7000_NX-OS_Security_Configuration_Guide__Release_6-x/b_Cisco_Nexus_7000_NX-OS_Security_Configuration_Guide__Release_6-x_chapter_011010.html)
- [nmap ARP scanning issues](https://github.com/nmap/nmap/issues/92)
- [arp-scan tool](https://linux.die.net/man/1/arp-scan)

## Our Implementation

### Targeted Retries

Like production tools (nmap, arp-scan), we use **targeted retries** rather than simple broadcast flooding:

1. **Round 1:** Send ARP request to all target IPs
2. **Wait:** Allow time for responses (3 seconds per round)
3. **Round 2:** Send ARP request only to IPs that didn't respond
4. **Repeat:** Continue for configured number of retries
5. **Final wait:** Extra receive period for late arrivals

This approach:
- Minimizes total packets sent (only retry non-responders)
- Gives slow hosts multiple chances to respond
- Matches behavior of established tools

### Configurable Rate Limiting

We provide a configurable packets-per-second rate limit to work safely with any network equipment:

**Default:** 50 pps (safe for most enterprise networks)

**Timing at various rates:**

| Rate (pps) | 256 IPs (/24) | 1024 IPs (/22) | 4096 IPs (/20) |
|------------|---------------|----------------|----------------|
| 15 pps | ~17 sec | ~68 sec | ~273 sec |
| 50 pps | ~5 sec | ~20 sec | ~82 sec |
| 100 pps | ~2.5 sec | ~10 sec | ~41 sec |
| 500 pps | ~0.5 sec | ~2 sec | ~8 sec |

*Times shown are per round. Multiply by (1 + retries) for total ARP scan time.*

### Streaming Results

Rather than waiting for all ARP responses before proceeding, we stream results to the port scanner as they arrive:

1. ARP responses feed directly into deep scan queue
2. Hosts are port-scanned as soon as they're discovered
3. Late ARP arrivals are added to the scan queue automatically
4. No artificial phases or waiting periods

This means:
- First discovered host starts port scanning immediately
- Total discovery time is ARP scan + longest individual host scan
- Late responders don't delay the overall process

## Configuration Options

### `arp_retries` (default: 2)

Number of retry rounds for non-responding hosts.

- `0` = Single attempt only (fastest, may miss hosts)
- `2` = 3 total attempts (default, good balance)
- `5` = 6 total attempts (thorough, slower)

**When to increase:**
- Missing known hosts that respond to manual ping
- High packet loss network
- Very large subnets

### `arp_rate_pps` (default: 50)

Maximum ARP packets per second.

- `15` = Ultra-conservative (Cisco untrusted port safe)
- `50` = Default (safe for most enterprise networks)
- `100` = Faster (safe for most networks without strict DAI)
- `500+` = Aggressive (only for known tolerant networks)

**When to decrease:**
- Hosts being missed on managed Cisco switches
- Network admin reports ARP-related alerts
- Port going to errdisable state

**When to increase:**
- Scanning large subnets and time is critical
- Network is known to have high ARP rate limits
- Home/small office network without enterprise switches

### `use_npcap_arp` (Windows only, default: false)

Use Npcap for broadcast ARP instead of Windows SendARP API.

- `false` = Use native Windows SendARP (sequential, slower)
- `true` = Use Npcap broadcast ARP (parallel, faster, requires Npcap installed)

## Troubleshooting

### Symptoms: Not all hosts discovered

1. **Check ARP retries:** Increase `arp_retries` to 3-5
2. **Check rate limit:** Decrease `arp_rate_pps` to 15-30
3. **Check switch logs:** Look for DAI violations or rate limit hits
4. **Manual test:** Run `arping -c 3 <ip>` to verify host responds

### Symptoms: Port goes to errdisable (Cisco)

1. **Immediate action:** Re-enable port: `no shutdown`
2. **Fix:** Decrease `arp_rate_pps` to 15 or lower
3. **Alternative:** Ask network admin to increase DAI rate limit or trust the port

### Symptoms: Scanning is too slow

1. **Check network:** Verify no DAI rate limiting in place
2. **Increase rate:** Set `arp_rate_pps` to 100-500
3. **Decrease retries:** Set `arp_retries` to 1

## Implementation Files

- `backend/src/daemon/utils/arp/broadcast.rs` - Core ARP scanning logic
- `backend/src/daemon/utils/arp/mod.rs` - Platform abstraction
- `backend/src/daemon/discovery/service/network.rs` - Integration with discovery pipeline
- `backend/src/daemon/shared/config.rs` - Configuration options
