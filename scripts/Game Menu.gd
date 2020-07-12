extends Control

signal read_sound

func _ready() -> void:
	$main.slide_in()


func _on_main_settings_pressed() -> void:
	$main.slide_out()
	$settings.slide_in()
	emit_signal("read_sound")


func _on_settings_back_pressed() -> void:
	$settings.slide_out()
	$main.slide_in()


func _on_main_play_pressed() -> void:
	get_tree().change_scene("res://scenes/LevelSelectScene.tscn")


func _on_settings_sound_pressed() -> void:
	ConfigManager.sound_on = !ConfigManager.sound_on
	
