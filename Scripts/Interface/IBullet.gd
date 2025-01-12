extends Node2D
class_name IBullet

var can_move : bool = false
var _damage : float = 0

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if not can_move: return
	move(delta)

func shoot(angle : float = 0, force : float = 0, damage : float = 0):
	can_move = true
	_damage = damage
func move(delta): pass
