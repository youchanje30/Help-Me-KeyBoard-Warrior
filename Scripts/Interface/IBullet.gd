extends Node2D
class_name IBullet

var can_move : bool = false


func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	if not can_move: return
	move(delta)

func shoot(angle : float = 0, force : float = 0):
	can_move = true
func move(delta): pass
