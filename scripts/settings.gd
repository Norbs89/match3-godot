extends "res://scripts/BaseMenuPanel.gd"

signal sound_pressed
signal back_pressed
export (Texture) var sound_on
export (Texture) var sound_off


func _on_button1_pressed() -> void:
	ConfigManager.sound_on = !ConfigManager.sound_on
	change_sound_texture()
	ConfigManager.save_config()
	SoundManager.set_volume()
	SoundManager.play_fixed_sound(0)



func change_sound_texture():
	if ConfigManager.sound_on == true:
		$"MarginContainer/graph and buttons/buttons/button1".texture_normal = sound_on
	else:
		$"MarginContainer/graph and buttons/buttons/button1".texture_normal = sound_off

func _on_button2_pressed() -> void:
	SoundManager.play_fixed_sound(0)
	emit_signal("back_pressed")


func _on_Game_Menu_read_sound() -> void:
	change_sound_texture()
