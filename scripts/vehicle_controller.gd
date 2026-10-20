extends VehicleBody3D

@export var engine_force_value: float = 250.0
@export var brake_force: float = 60.0
@export var max_steer: float = 0.45
@export var handbrake_force: float = 120.0

var _spawn_transform: Transform3D

func _ready() -> void:
	_spawn_transform = global_transform
	var cfg := ConfigFile.new()
	if cfg.load("user://settings.cfg") == OK:
		# apply steering sensitivity as multiplier on max_steer base
		var s: float = cfg.get_value("input", "steer_sensitivity", 1.0)
		max_steer = max_steer * s

func _physics_process(_delta: float) -> void:
	var accel := Input.get_action_strength("accelerate")
	var br := Input.get_action_strength("brake_reverse")
	var steer := Input.get_action_strength("steer_right") - Input.get_action_strength("steer_left")
	var hb := Input.get_action_strength("handbrake")

	steering = steer * max_steer

	var forward_speed := linear_velocity.dot(-global_transform.basis.z)

	if hb > 0.0:
		engine_force = 0.0
		brake = hb * handbrake_force
	elif accel > 0.0:
		engine_force = accel * engine_force_value
		brake = 0.0
	elif br > 0.0:
		if forward_speed > 1.0:
			engine_force = 0.0
			brake = br * brake_force
		else:
			engine_force = -br * engine_force_value * 0.5
			brake = 0.0
	else:
		engine_force = 0.0
		brake = 0.0

	if Input.is_action_just_pressed("reset_vehicle"):
		_reset()

func _reset() -> void:
	global_transform = _spawn_transform
	linear_velocity = Vector3.ZERO
	angular_velocity = Vector3.ZERO
