extends Node


var damage_buff_list : Array[float] = []

func _ready() -> void:
	damage_buff_list.resize(26)


func GetDamage(index: int):
	return 5 + damage_buff_list[index]

func damage_buff(index: int, val: float):
	damage_buff_list[index] += val

func ResetDamage():
	damage_buff_list.fill(0)
