extends Camera3D

@export var follow_distance: float = 8.0
@export var height: float = 4.0
@export var follow_speed: float = 6.0
@export var look_height: float = 1.0

var _target: Node3D

func _ready() -> void:
	_target = get_node_or_null("../Vehicle")
	if _target == null:
		_target = get_parent().get_node_or_null("Vehicle")
	var cfg := ConfigFile.new()
	if cfg.load("user://settings.cfg") == OK:
		follow_speed = cfg.get_value("camera", "follow_speed", follow_speed)

func _physics_process(delta: float) -> void:
	if _target == null:
		return
	var back := _target.global_transform.basis.z
	var desired := _target.global_position + back * follow_distance + Vector3.UP * height
	global_position = global_position.lerp(desired, clamp(follow_speed * delta, 0.0, 1.0))
	look_at(_target.global_position + Vector3.UP * look_height, Vector3.UP)
