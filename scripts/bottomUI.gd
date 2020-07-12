extends TextureRect

signal pause_game
signal booster_pressed



func _on_pause_pressed() -> void:
	emit_signal("pause_game")
	get_tree().paused = true


func _on_booster1_pressed() -> void:
	emit_signal("booster_pressed", BoosterInfoGlobal.booster_info[1])
	$MarginContainer/HBoxContainer/booster1.disabled = true
	$MarginContainer/HBoxContainer/booster1.modulate = Color(0.5,0.5,0.5,1)
	pass # Replace with function body.


func _on_booster2_pressed() -> void:
	emit_signal("booster_pressed", BoosterInfoGlobal.booster_info[2])
	$MarginContainer/HBoxContainer/booster2.disabled = true
	$MarginContainer/HBoxContainer/booster2.modulate = Color(0.5,0.5,0.5,1)


func _on_booster3_pressed() -> void:
	emit_signal("booster_pressed", BoosterInfoGlobal.booster_info[3])
	$MarginContainer/HBoxContainer/booster3.disabled = true
	$MarginContainer/HBoxContainer/booster3.modulate = Color(0.5,0.5,0.5,1)
