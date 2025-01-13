extends Node2D
class_name IBullet

@export var area : Area2D

var can_move : bool = false
var _damage : float = 0

func _ready() -> void:
	area.connect("area_entered", area_enter)


func _process(delta: float) -> void:
	if not can_move: return
	move(delta)

func shoot(angle : float = 0, force : float = 0, damage : float = 0):
	can_move = true
	_damage = damage
func move(delta): pass


func area_enter(area: Area2D) -> void:
	if area.get_parent() is not IEnemy: return
	var enemy = area.get_parent()
	enemy.get_damage(_damage)
