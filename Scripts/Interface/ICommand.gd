extends Node
class_name key_command

signal ExecuteChange

@export var cool_time : float
var can_execute : bool = true :
	set (value):
		can_execute = value
		emit_signal("ExecuteChange", can_execute)

func set_command()->void: pass
func execute(angle : float = 0, force : float = 0, damage : float = 0)->void:
	can_execute = false
	CoolDown()


func CoolDown():
	await get_tree().create_timer(cool_time).timeout
	can_execute = true
	
