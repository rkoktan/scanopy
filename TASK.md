# Task: Daemon Creation - Use Existing API Key Option

> **First:** Read `CLAUDE.md` (project instructions) — you are a **worker**.

## Objective

Allow users creating a daemon from within the app (NOT during onboarding) to choose between generating a new API key or using an existing one. If using existing, provide an input field to paste the key.

## Requirements

1. Add toggle/choice: "Generate new key" vs "Use existing key"
2. If "Use existing key" selected, show text input for pasting key
3. Pasted key populates the binary run command and docker compose output
4. **Only in app** (CreateDaemonModal), NOT during onboarding (MultiDaemonSetup)

## Context

**App flow (CreateDaemonModal):** User is in the Daemons tab, clicks "Create Daemon"
- This is where the new option should appear

**Onboarding flow (MultiDaemonSetup):** User is registering, setting up first daemons
- Do NOT add the option here - keep existing "Install Now" / "Install Later" flow

## Acceptance Criteria

- [ ] CreateDaemonModal has option to use existing key
- [ ] Text input appears when "Use existing key" selected
- [ ] Pasted key flows through to run command and docker compose
- [ ] Validation: key format looks reasonable (non-empty at minimum)
- [ ] MultiDaemonSetup unchanged (onboarding flow)
- [ ] Tests pass: `cd ui && npm test`
- [ ] Linting passes: `make format && make lint`

## Files to Modify

### Primary

**File:** `ui/src/lib/features/daemons/components/CreateDaemonModal.svelte`

Current flow:
1. User fills daemon form
2. Clicks "Generate Key" button
3. `handleCreateNewApiKey()` creates key via API
4. Key stored in `keyState`, passed to `CreateDaemonForm`

New flow:
1. User fills daemon form
2. **New:** Chooses "Generate new key" or "Use existing key"
3. If generate: existing flow (API call)
4. If existing: show input field, user pastes key
5. Either way, key passed to `CreateDaemonForm`

### Secondary

**File:** `ui/src/lib/features/daemons/components/CreateDaemonForm.svelte`

May need minor updates if key handling changes, but likely no changes needed - it already accepts `apiKey` prop.

## UI Suggestions

Option 1 - Radio buttons:
```
( ) Generate new API key
( ) Use existing API key
    [_________________________] <- input appears when selected
```

Option 2 - Tabs or segmented control:
```
[Generate New] [Use Existing]
```

Option 3 - Secondary action:
```
[Generate Key]  or  [Use Existing Key]
```

Pick whichever fits the existing UI patterns best. Check other modals/forms for consistency.

## Implementation Notes

1. **Key state:** Currently `keyState` is populated by API response. For pasted keys, set it directly from input value.

2. **Validation:** At minimum, check the pasted key is non-empty. Optionally check format (prefix, length) if there's a known pattern.

3. **No backend changes:** The key is just passed to the command/compose generation - no API calls needed for "use existing" flow.

4. **Distinguish from onboarding:** The modal already knows it's not in onboarding mode. Check how `onboardingMode` prop is used if needed.

## Reference

Look at `CreateDaemonForm.svelte` lines 131-253 to see how keys are used in command generation:
- `buildRunCommand()` - includes `--daemon-api-key ${key}`
- `buildDockerCompose()` - includes `SCANOPY_DAEMON_API_KEY` env var

---

## Work Summary

### What was implemented

Added the ability for users to choose between generating a new API key or using an existing one when creating a daemon from within the app (CreateDaemonModal).

**Changes to `ui/src/lib/features/daemons/components/CreateDaemonModal.svelte`:**

1. **New state variables:**
   - `keySource`: Tracks whether user selected 'generate' or 'existing'
   - `existingKeyInput`: Stores the pasted API key value

2. **New handlers:**
   - `handleKeySourceChange()`: Resets key state when switching between options
   - `handleUseExistingKey()`: Validates form and sets the pasted key

3. **Updated `handleOnClose()`:** Resets new state variables when modal closes

4. **Updated UI (lines 169-256):**
   - Radio button selection: "Generate new API key" / "Use existing API key"
   - Conditional rendering based on selection:
     - Generate: Existing flow (Generate Key button + CodeContainer)
     - Existing: Text input + "Use Key" button
   - Radio buttons disabled once a key is set (to prevent switching after key is in use)
   - Shows the entered key in CodeContainer after submission

### Files changed
- `ui/src/lib/features/daemons/components/CreateDaemonModal.svelte`

### No changes to
- `CreateDaemonForm.svelte` (already accepts `apiKey` prop correctly)
- `MultiDaemonSetup.svelte` (onboarding flow unchanged as required)

### Validation
- Form validation runs before key is accepted (same pattern as generate flow)
- Empty key input shows error via `pushError()`
- Key must be non-empty after trim

### Testing
- `make format` - passed
- `make lint` - passed (includes svelte-check with 0 errors)
