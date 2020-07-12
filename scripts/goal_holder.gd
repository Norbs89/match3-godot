extends Node

signal create_goal
signal game_won

var current_lvl = 0

func _ready() -> void:
	create_goals()

func create_goals():
	for i in get_child_count():
		var current = get_child(i)
		emit_signal("create_goal", current.max_needed, current.goal_texture, current.goal_string)

func check_goals(goal_type):
	for i in get_child_count():
		get_child(i).check_goal(goal_type)
	check_game_win()

func goals_met():
	for i in get_child_count():
		if !get_child(i).goal_met:
			return false
	return true

func check_game_win():
	if goals_met():
		emit_signal("game_won")
		GameDataManager.level_info[current_lvl + 1] = {
		"unlocked": true,
		"high_score": 0,
		"stars_unlocked": 0
	}


func _on_grid_check_goal(goal_type) -> void:
	check_goals(goal_type)

func _on_ice_holder_break_ice(goal_type) -> void:
	check_goals(goal_type)

func _on_lock_holder_break_lock(goal_type) -> void:
	check_goals(goal_type)

func _on_topUI_notify_of_lvl(lvl) -> void:
	current_lvl = lvl
