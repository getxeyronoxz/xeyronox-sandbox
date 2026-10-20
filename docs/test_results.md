# Test Results

## Environment
- Godot 4.7.2.stable.official.ed1daf0bf
- Windows, headless mode (no display attached to test runner).

## Executed
| Check | Command | Result |
|---|---|---|
| Import | `godot --headless --path ... --import` | PASS (exit 0) |
| Startup | `godot --headless --path ... --quit` | PASS (exit 0) |
| 120-frame run | `godot --headless --path ... --quit-after 120` | PASS (exit 0, no errors) |

## Test IDs (from acceptance_tests.md)
- AT-01: PASS (headless import/startup).
- AT-02..AT-10, AT-13, AT-14, AT-15, AT-16, AT-19, AT-20: NOT VERIFIED — require interactive playtest / real Android hardware. Headless startup is not proof of driving behavior, rendering, or frame rate.

## Notes
- No runtime errors or GDScript parse errors observed.
- Driving feel, camera behavior, and performance must be evaluated by the developer on real hardware.