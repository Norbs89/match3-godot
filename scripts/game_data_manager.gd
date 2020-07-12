extends Node

var level_info = {}
var default_lvl_info = {
	1: {
		"unlocked": true,
		"high_score": 0,
		"stars_unlocked": 0
	}
}
onready var path = "user://save.dat"



func _ready() -> void:
	level_info = load_data()
	level_info = default_lvl_info
	save_data()

func save_data():
	var file = File.new()
	var err = file.open(path, File.WRITE)
	if err != OK:
		print("something went wrong")
		return
	file.store_var(level_info)
	file.close()

func load_data():
	var file = File.new()
	var err = file.open(path, File.READ)
	if err != OK:
		return default_lvl_info
		print("something is wrong")
	var read = {}
	read = file.get_var()
	return read

