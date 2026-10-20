# Decisions

- Renderer: Compatibility (OpenGL) for desktop and mobile.
- Vehicle physics: VehicleBody3D first (tunable); RigidBody3D alternative retained as option if needed.
- Persistence: settings only (ConfigFile in user://); no save-game in v0.1.
- Touch controls: on-screen buttons mapped to input actions; visible only on Android (hidden on desktop).
- Scene flow: main_menu.tscn is entry; main.tscn is gameplay; pause via CanvasLayer PauseMenu.
- No third-party assets; primitive geometry only.