extends Node2D

export (int) var health;

func _ready() -> void:
	pass # Replace with function body.

func take_dmg(dmg):
	health -= dmg;
	#dmg effect goes here
