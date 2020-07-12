extends HBoxContainer



func _ready() -> void:
	BoosterInfoGlobal.booster_info[1] = "Add Moves"
	BoosterInfoGlobal.booster_info[2] = "Color Bomb"
	activate_booster_buttons()

func activate_booster_buttons():
	for i in range(1, get_child_count()):
		if get_child(i).is_in_group("Boosters"):
			if BoosterInfoGlobal.booster_info[i] == "":
				get_child(i).check_active(false, null)
			else:
				get_child(i).check_active(true, BoosterInfoGlobal.booster_info[i])
