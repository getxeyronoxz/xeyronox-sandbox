# Known Issues

- Driving feel, camera behavior, and performance are unverified (no interactive playtest performed in this environment).
- Android export unverified: attempted to download Godot 4.7.2 export templates (1.28 GB) but download failed (curl exit code 1, incomplete file ~850 MB). Templates not installed. Android SDK present (platforms 34-37, build-tools 34-36, NDK 28.2, CMake 3.22.1). Export requires manual template install by user.
- Touch controls untested on a touch device.
- VehicleBody3D tuning values are initial guesses; may need iteration.
- No automated test framework; verification is manual + headless startup only.