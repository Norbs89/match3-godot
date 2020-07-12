extends "res://scripts/BaseMenuPanel.gd"

signal play_pressed
signal settings_pressed


func _on_button1_pressed() -> void:
	emit_signal("play_pressed")


func _on_button2_pressed() -> void:
	emit_signal("settings_pressed")
