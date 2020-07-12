extends TextureRect

onready var score_label =$MarginContainer/HBoxContainer/VBoxContainer/ScoreLabel
onready var counter_label = $MarginContainer/HBoxContainer/CounterLabel
onready var score_bar = $MarginContainer/HBoxContainer/VBoxContainer/TextureProgress
onready var goal_container = $MarginContainer/HBoxContainer/HBoxContainer
export (PackedScene) var goal_prefab
export (int) var current_lvl
var current_score = 0
var current_count = 0

signal notify_of_lvl


func _ready() -> void:
	_on_grid_update_score(current_score)
	emit_signal("notify_of_lvl", current_lvl)

func setup_score_bar(max_score):
	score_bar.max_value = max_score

func update_score_bar():
	score_bar.value = current_score

func _on_grid_update_score(amount) -> void:
	current_score += amount
	update_score_bar()
	score_label.text = String(current_score)
	if GameDataManager.level_info.has(current_lvl):
		GameDataManager.level_info[current_lvl]["high_score"] = current_score
	if current_score >= score_bar.max_value / 2:
		GameDataManager.level_info[current_lvl]["stars_unlocked"] = 1
	if current_score >= score_bar.max_value - score_bar.max_value / 4:
		GameDataManager.level_info[current_lvl]["stars_unlocked"] = 2
	if current_score >= score_bar.max_value:
		GameDataManager.level_info[current_lvl]["stars_unlocked"] = 3

	
func make_goal(new_max, new_texture, new_value):
	var current = goal_prefab.instance()
	if !goal_container:
		goal_container = $MarginContainer/HBoxContainer/HBoxContainer
	goal_container.add_child(current)
	current.set_goal_values(new_max, new_texture, new_value)

func _on_grid_update_counter(amount = -1) -> void:
	current_count += amount
	counter_label.text = String(current_count)

func _on_grid_setup_max_score(max_score) -> void:
	setup_score_bar(max_score)

func _on_goal_holder_create_goal(new_max, new_texture, new_value) -> void:
	make_goal(new_max, new_texture, new_value)

func _on_grid_check_goal(goal_type) -> void:
	for i in goal_container.get_child_count():
		goal_container.get_child(i).update_goal_values(goal_type)
	pass

func _on_ice_holder_break_ice(goal_type) -> void:
	for i in goal_container.get_child_count():
		goal_container.get_child(i).update_goal_values(goal_type)
	pass

func _on_lock_holder_break_lock(goal_type) -> void:
	for i in goal_container.get_child_count():
		goal_container.get_child(i).update_goal_values(goal_type)
	pass

