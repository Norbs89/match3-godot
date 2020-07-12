extends "res://scripts/BaseMenuPanel.gd"

var level_select = preload("res://scenes/LevelSelectScene.tscn")

func _on_continue_pressed() -> void:
	get_tree().paused = false
	slide_out()


func _on_quit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to(level_select)


func _on_bottomUI_pause_game() -> void:
	slide_in()
