extends Node

var key_list : Array[key_controller]

func _ready() -> void:
	key_list.resize(27)

func add_key(index:int, key:key_controller):
	key_list[index] = key

func input_key(index: int, is_pressed : bool):
	if is_pressed:
		key_list[index].press_btn()
		cur_key_list.append(index)
	else:
		key_list[index].up_btn()


var cur_key_list = []
func reset_key():
	for index in cur_key_list:
		key_list[index].disable_btn()
