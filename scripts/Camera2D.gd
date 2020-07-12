extends Camera2D

onready var screen_kick = $screenKick

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func camera_effect():
	screen_kick.interpolate_property(self, "zoom", Vector2(0.9,0.9), Vector2(1,1), 0.1, Tween.TRANS_BACK, Tween.EASE_IN_OUT)
	screen_kick.start()

func move_camera(placement):
	offset = placement

func _on_grid_place_camera(placement) -> void:
	move_camera(placement)

func _on_grid_camera_effect() -> void:
	camera_effect()
