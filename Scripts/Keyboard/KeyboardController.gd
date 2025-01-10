extends Node

var key_list : Array[IKey]
var cur_key_list : Array[int] = []


func _ready() -> void:
	key_list.resize(27)

var nonekey = preload("res://Scenes/Keys/nonekey.tscn")

#region key controll
func add_key(index:int, key_sprite:key_sprite_controller):
	var key = nonekey.instantiate()
	add_child(key)
	key_list[index] = key
	key.set_key(key_sprite)

	# 50% to buy
	if randi_range(0, 1) == 0: buy_key(index)


func sell_key(index:int):
	key_list[index].sell_key()

func buy_key(index:int):
	key_list[index].buy_key()

func input_key(index: int, is_pressed : bool):
	key_list[index].down_key()
	cur_key_list.append(index)

func reset_key():
	while not cur_key_list.is_empty():
		key_list[cur_key_list.pop_back()].up_key()
#endregion
