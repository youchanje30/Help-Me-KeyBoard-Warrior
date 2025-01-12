extends Node2D
class_name IEnemy

@export var anim : AnimationPlayer

var max_hp : float = 10
var cur_hp : float = 10

func _ready() -> void:
	cur_hp = max_hp
func _process(delta: float) -> void:
	move(delta)

#region Move Process
func move(delta)->void: pass
#endregion


#region Damage Process
func get_damage(damage : float):
	damage_effect()
	cur_hp -= damage
	if cur_hp <= 0:
		self.queue_free()

func damage_effect():
	anim.play("Hurt")
#endregion
