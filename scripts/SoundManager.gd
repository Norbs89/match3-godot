extends Node2D

onready var music_player = $MusicPlayer
onready var sound_player = $SoundPlayer

var possible_music = [
	preload("res://art/Match 3 Sounds/Music/theme-1.ogg"),
	preload("res://art/Match 3 Sounds/Music/theme-2.ogg"),
	preload("res://art/Match 3 Sounds/Music/theme-3.ogg"),
	preload("res://art/Match 3 Sounds/Music/theme-4.ogg")
]

var possible_sounds = [
	preload("res://art/Match 3 Sounds/Sounds/1.ogg"),
	preload("res://art/Match 3 Sounds/Sounds/3.ogg"),
	preload("res://art/Match 3 Sounds/Sounds/4.ogg"),
	preload("res://art/Match 3 Sounds/Sounds/5.ogg"),
	preload("res://art/Match 3 Sounds/Sounds/6.ogg"),
	preload("res://art/Match 3 Sounds/Sounds/7.ogg")
]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	set_volume()
	play_random_music()


func play_random_music():
	var temp = floor(rand_range(0, possible_music.size()))
	music_player.stream = possible_music[temp]
	music_player.play()

func play_random_sound():
	var temp = floor(rand_range(0, possible_sounds.size()))
	sound_player.stream = possible_sounds[temp]
	sound_player.play()

func play_fixed_sound(sound):
	sound_player.stream = possible_sounds[sound]
	sound_player.play()

func set_volume():
	if ConfigManager.sound_on:
		music_player.volume_db = -10
		sound_player.volume_db = -10
	else:
		sound_player.volume_db = -80
		music_player.volume_db = -80
