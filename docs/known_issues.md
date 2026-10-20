# Known Issues

- Driving feel, camera behavior, and performance are unverified (no interactive playtest performed in this environment).
- Android export: SUCCESS. Debug APK built (`build/xeyronox.apk`, 162,618,458 bytes, 145 zip entries). Android SDK present (platforms 34-37, build-tools, NDK, CMake). Export templates installed (4.7.2.stable). No device connected; runtime/device performance not tested.
- Touch controls untested on a touch device.
- VehicleBody3D tuning values are initial guesses; may need iteration.
- No automated test framework; verification is manual + headless startup only.