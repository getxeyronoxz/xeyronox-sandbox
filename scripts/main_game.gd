extends Node3D

@onready var speed_label: Label = $UI/SpeedLabel
@onready var vehicle: VehicleBody3D = $Vehicle
@onready var pause_menu: Control = $UI/PauseMenu
@onready var touch_controls: Control = $UI/TouchControls

func _ready() -> void:
	pause_menu.visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS
	pause_menu.get_node("Panel/VBoxContainer/ResumeButton").pressed.connect(_on_resume)
	pause_menu.get_node("Panel/VBoxContainer/RestartButton").pressed.connect(_on_restart)
	pause_menu.get_node("Panel/VBoxContainer/MenuButton").pressed.connect(_on_menu)
	_wire_touch()

func _wire_touch() -> void:
	var tc := touch_controls
	_bind_button(tc.get_node("Throttle"), "accelerate")
	_bind_button(tc.get_node("Brake"), "brake_reverse")
	_bind_button(tc.get_node("SteerLeft"), "steer_left")
	_bind_button(tc.get_node("SteerRight"), "steer_right")
	_bind_button(tc.get_node("Reset"), "reset_vehicle")
	_bind_button(tc.get_node("Pause"), "pause")
	if OS.get_name() != "Android":
		tc.visible = false

func _bind_button(btn: Button, action: String) -> void:
	btn.button_down.connect(func(): Input.action_press(action))
	btn.button_up.connect(func(): Input.action_release(action))

func _process(_delta: float) -> void:
	if get_tree().paused:
		return
	if vehicle:
		var speed := vehicle.linear_velocity.length()
		speed_label.text = "Speed: %d" % int(speed * 3.6)  # m/s -> km/h approx

func _ready() -> void:
	pause_menu.visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS
	pause_menu.get_node("Panel/VBoxContainer/ResumeButton").pressed.connect(_on_resume)
	pause_menu.get_node("Panel/VBoxContainer/RestartButton").pressed.connect(_on_restart)
	pause_menu.get_node("Panel/VBoxContainer/MenuButton").pressed.connect(_on_menu)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		_toggle_pause()

func _toggle_pause() -> void:
	var paused := not get_tree().paused
	get_tree().paused = paused
	pause_menu.visible = paused

func _on_resume() -> void:
	_toggle_pause()

func _on_restart() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_menu() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")
