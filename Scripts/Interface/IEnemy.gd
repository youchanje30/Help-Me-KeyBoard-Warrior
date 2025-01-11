extends Node2D
class_name IEnemy

var max_hp : float = 10
var cur_hp

func _ready() -> void: pass
func _process(delta: float) -> void:
	move(delta)

#region Move Process
func move(delta)->void: pass
#endregion


#region Damage Process
func get_damage(): pass

#endregion
