extends Control

const SETTINGS_PATH := "user://settings.cfg"

func _ready() -> void:
	$VBox/BackButton.pressed.connect(_on_back)
	_load()

func _load() -> void:
	var cfg := ConfigFile.new()
	if cfg.load(SETTINGS_PATH) == OK:
		$VBox/SteerSlider.value = cfg.get_value("input", "steer_sensitivity", 1.0)
		$VBox/CamSlider.value = cfg.get_value("camera", "follow_speed", 6.0)

func _save() -> void:
	var cfg := ConfigFile.new()
	cfg.set_value("input", "steer_sensitivity", $VBox/SteerSlider.value)
	cfg.set_value("camera", "follow_speed", $VBox/CamSlider.value)
	cfg.save(SETTINGS_PATH)

func _on_back() -> void:
	_save()
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")
