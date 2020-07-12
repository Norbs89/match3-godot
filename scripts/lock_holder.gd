extends Node2D

signal remove_lock

var lock_pieces = []
var width = 8
var height = 10
var licorice = preload("res://scenes/licorice.tscn")
signal break_lock
export (String) var value

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.


func make_2d_array():
	var array = [];
	for i in width:
		array.append([]);
		for j in height:
			array[i].append(null);
	return array;

func _on_grid_make_lock(board_position) -> void:
	if lock_pieces.size() == 0:
		lock_pieces = make_2d_array()
	var current = licorice.instance()
	add_child(current)
	current.position = Vector2(board_position.x * 64 + 64, -board_position.y * 64 + 800)
	lock_pieces[board_position.x][board_position.y] = current



func _on_grid_dmg_lock(board_position) -> void:
	if lock_pieces.size() != 0:
		if lock_pieces[board_position.x][board_position.y] != null:
			lock_pieces[board_position.x][board_position.y].take_dmg(1)
			if lock_pieces[board_position.x][board_position.y].health <= 0:
				lock_pieces[board_position.x][board_position.y].queue_free()
				lock_pieces[board_position.x][board_position.y] = null
				emit_signal("remove_lock", board_position)
				emit_signal("break_lock", value)

