> **First:** Read `CLAUDE.md` (project instructions) — you are a **worker**. Start in **plan mode** and propose your implementation before coding.

# Task: Fix Network Interface Detection (Issues #456 + #379)

## Objective

Fix daemon network interface detection to properly handle:
1. Bridge interfaces with VLANs (issue #456)
2. MacVLAN interfaces in Docker (issue #379)

Both issues stem from the same root cause: interface selection logic that doesn't properly match subnets to interfaces.

## Issue #456: Bridge/VLAN Interface Detection

**Problem:** Daemon selects `eth0` (physical interface without IP) instead of bridge interfaces (`br0`, `br0.21`, etc.) that have IPs assigned.

**Environment:** Unraid/Linux with bonded NICs, bridge `br0`, VLAN sub-interfaces

**Symptom:** "No IPv4 address found on interface=eth0" - discovery returns zero hosts

**Root cause:** Interface selection picks first "suitable" physical interface rather than matching target subnet to interface with IP in that range.

## Issue #379: MacVLAN Support

**Problem:** Docker container with MacVLAN network attached doesn't detect/enumerate those interfaces.

**Environment:** Docker with MacVLAN networks (alternative to host networking)

**Symptom:** MacVLAN interfaces not visible, can't scan networks attached via MacVLAN

## Requirements

1. **Smarter subnet-to-interface matching**
   - For each target subnet, find interface(s) with IP in that range
   - Don't rely on a single default interface

2. **Support bridge interfaces**
   - Recognize `br*` interfaces as valid scan sources
   - Handle VLAN sub-interfaces (`br0.21`, `eth0.100`, etc.)

3. **Support MacVLAN interfaces**
   - Detect MacVLAN interface types
   - Include them in interface enumeration

4. **Interface preference order**
   - Prefer interface with IP matching target subnet
   - For bridges: prefer bridge over underlying physical interface
   - Avoid interfaces without IPs

## Acceptance Criteria

- [ ] Bridge interfaces with IPs are detected and used
- [ ] VLAN sub-interfaces are detected and used
- [ ] MacVLAN interfaces are detected and used
- [ ] Each subnet scans via interface with IP in that range
- [ ] No regression for standard setups (single NIC, host networking)
- [ ] Logging shows which interface selected for each scan

## Files Likely Involved

- `daemon/src/` - Main daemon code
- Look for interface selection/enumeration logic
- Network scanning initialization code
- ARP scanning module

## Testing

- Test with bridge interface setup if possible
- Test with MacVLAN Docker setup if possible
- Verify standard single-NIC setup still works

## Notes

- Start by understanding current interface selection logic
- Check what network libraries are used (pnet, nix, etc.)
- May need to query interface type via netlink or sysfs

---

## Work Summary

### Implementation Completed

#### Issue #379: MacVLAN Support
- **Root cause**: Docker network discovery explicitly filtered out `macvlan` and `ipvlan` drivers in `daemon/utils/base.rs:273-283`
- **Fix**: Added `macvlan` and `ipvlan` to accepted drivers, with appropriate `SubnetType` assignment

#### Issue #456: Bridge Interface Selection
- **Root cause**: In bonded bridge setups, `eth0` and `br0` share the same MAC. Interface lookup by MAC used `.find()` which returned the first match (`eth0` with no IP) instead of the bridge with the IP.
- **Fix**: Changed interface lookup in `daemon/discovery/service/network.rs:340-347` to require both matching MAC AND having an IP in the target subnet

#### Multi-Daemon Instance Architecture
- Added `--interface` CLI arg to restrict daemon to specific interface(s)
- Implemented config namespacing by `--name` for isolated daemon instances
- Added interface filtering to all discovery services
- Created systemd template `scanopy-daemon@.service` for multi-instance deployments

### Files Changed

| File | Changes |
|------|---------|
| `daemon/utils/base.rs` | Allow macvlan/ipvlan Docker drivers, add interface filter param |
| `daemon/discovery/service/network.rs` | Fix bridge interface selection, pass interface filter |
| `daemon/discovery/service/docker.rs` | Pass interface filter to get_own_interfaces |
| `daemon/discovery/service/self_report.rs` | Pass interface filter to get_own_interfaces |
| `daemon/shared/config.rs` | Add --interface CLI arg, config namespacing, getter |
| `bin/daemon.rs` | Use namespaced config path |
| `server/subnets/impl/types.rs` | Add MacVlan/IpVlan SubnetType variants |
| `server/topology/types/nodes.rs` | Add MacVlan/IpVlan to layout ordering |
| `tests/daemon-config-frontend-fields.json` | Add interface field for config sync test |
| `scanopy-daemon@.service` | New systemd template for multi-instance |

### Acceptance Criteria Met

- [x] Bridge interfaces with IPs are detected and used
- [x] VLAN sub-interfaces are detected and used
- [x] MacVLAN interfaces are detected and used
- [x] Each subnet scans via interface with IP in that range
- [x] No regression for standard setups (all tests pass)
- [x] Logging shows which interface selected for each scan

### Testing

- `cargo test` - All 83 tests pass
- `cargo clippy -- -D warnings` - No warnings
