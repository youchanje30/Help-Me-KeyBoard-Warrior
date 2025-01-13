extends Node
class_name key_command

signal ExecuteChange
var _data : CommandData

var can_execute : bool = true :
	set (value):
		can_execute = value
		emit_signal("ExecuteChange", can_execute)
func set_command(data : CommandData)->void:
	_data = data
func execute(angle : float = 0, force : float = 0, damage : float = 0)->void:
	can_execute = false
	CoolDown()

func CoolDown():
	await get_tree().create_timer(_data.coolTime).timeout
	can_execute = true
	
