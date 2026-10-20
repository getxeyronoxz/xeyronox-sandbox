extends Control

func _ready() -> void:
	$VBoxContainer/PlayButton.pressed.connect(_on_play)
	$VBoxContainer/SettingsButton.pressed.connect(_on_settings)
	$VBoxContainer/QuitButton.pressed.connect(_on_quit)

func _on_play() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_settings() -> void:
	# Simple toggle: load settings scene if present, else noop
	if ResourceLoader.exists("res://scenes/ui/settings_menu.tscn"):
		get_tree().change_scene_to_file("res://scenes/ui/settings_menu.tscn")

func _on_quit() -> void:
	get_tree().quit()
