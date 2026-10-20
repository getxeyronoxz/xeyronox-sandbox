# Development Status

**Stage:** B — vertical slice (in progress) / C partial.

## Current state
- Minimal driving prototype: VehicleBody3D + chase camera on a test track with primitive obstacles.
- Main menu (Play/Settings/Quit), pause menu (resume/restart/main menu), HUD speed label.
- Touch controls (Android-oriented, hidden on desktop) wired to input actions.
- Settings persisted via ConfigFile (steering sensitivity, camera follow speed).
- Renderer: Compatibility (OpenGL). Main scene: main_menu.tscn.

## Completed
- Phase 3A skeleton + git baseline (d078efb).
- Stage A: vehicle handling prototype (VehicleBody3D) — headless import/startup pass; no runtime errors.
- Stage B: vertical slice scaffolding (menu, pause, HUD, touch, settings).

## Next
- Interactive playtest of driving feel (cannot be verified headless).
- Evaluate VehicleBody3D vs RigidBody3D based on playtest.
- Performance measurement on target hardware.
- Android export prerequisites (deferred; no templates installed).

## Blockers
- No real Android device/export templates; Android export unverified.
- Visual/playtest verification not possible in this headless environment.