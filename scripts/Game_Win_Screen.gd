extends "res://scripts/BaseMenuPanel.gd"


var is_out = false


func _on_continue_button_pressed() -> void:
	get_tree().change_scene("res://scenes/LevelSelectScene.tscn")


func _on_goal_holder_game_won() -> void:
	if is_out == false:
		is_out = true
		slide_in()
