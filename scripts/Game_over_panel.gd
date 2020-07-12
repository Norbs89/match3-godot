extends "res://scripts/BaseMenuPanel.gd"



func _on_quit_button_pressed() -> void:
	get_tree().change_scene("res://scenes/Game Menu.tscn")
	pass # Replace with function body.


func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()


func _on_grid_game_over() -> void:
	slide_in()
