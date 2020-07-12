extends Node2D


func _ready() -> void:
	$AnimatedSprite.playing = true


func _on_AnimatedSprite_animation_finished() -> void:
	queue_free()
