extends Node

var bomb = false

func play_click_noise():
	SoundManager.play_fixed_sound(1)
	pass

func play_random_noise():
	SoundManager.play_random_sound()
	pass

func play_bomb_sound(type):
	if type == "col" or type == "row":
		SoundManager.play_fixed_sound(2)
	if type == "adj":
		SoundManager.play_fixed_sound(3)
	if type == "color":
		SoundManager.play_fixed_sound(4)



func _on_grid_play_sound() -> void:
		SoundManager.play_fixed_sound(5)

func _on_grid_play_bomb_sound(type) -> void:
	play_bomb_sound(type)
