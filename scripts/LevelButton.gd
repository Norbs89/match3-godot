extends Node2D

export(int) var level
export(String) var level_to_load
export(bool) var enabled
export(bool) var score_goal_met = false
var one_star_met = false
var two_star_met = false

#textures
export(Texture) var blocked_texture
export(Texture) var open_texture
export(Texture) var goal_met
export(Texture) var goal_not_met

onready var level_label = $TextureButton/Label
onready var button = $TextureButton
onready var star1 = $star1
onready var star2 = $star2
onready var star3 = $star3


func _ready() -> void:
	if GameDataManager.level_info.has(level):
		enabled = GameDataManager.level_info[level]["unlocked"]
		if GameDataManager.level_info[level]["stars_unlocked"] == 1:
			one_star_met = true
		if GameDataManager.level_info[level]["stars_unlocked"] == 2:
			one_star_met = true
			two_star_met = true
		if GameDataManager.level_info[level]["stars_unlocked"] == 3:
			score_goal_met = true
	else:
		enabled = false
	setup()


func setup():
	level_label.text = String(level)
	if enabled:
		button.texture_normal = open_texture
	else:
		button.texture_normal = blocked_texture
	if one_star_met:
		star1.texture = goal_met
	if two_star_met:
		star1.texture = goal_met
		star2.texture = goal_met
	if score_goal_met:
		star1.texture = goal_met
		star2.texture = goal_met
		star3.texture = goal_met


func _on_TextureButton_pressed() -> void:
	if enabled:
		get_tree().change_scene(level_to_load)
