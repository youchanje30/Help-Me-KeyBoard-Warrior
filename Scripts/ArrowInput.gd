extends Node2D

var angle : float = 0 
var speed = 30
func _ready() -> void:
	rotate(0)

func _process(delta: float) -> void:
	angle += speed * delta
	if angle > 360: angle = 0
	set_rotation(deg_to_rad(-angle))
