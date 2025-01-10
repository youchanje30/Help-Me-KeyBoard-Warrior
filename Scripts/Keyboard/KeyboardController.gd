extends Node

var key_list : Array[key_controller]
var pressed_key_list : Array[bool]

func _ready() -> void:
	key_list.resize(27)
	pressed_key_list.resize(27)
	pressed_key_list.fill(false)

func add_key(index:int, key:key_controller):
	key_list[index] = key

func input_key(index: int, is_pressed : bool):
	# up btn has not good image
	# just keeping press_btn is more better than before
	
	#if is_pressed:
		#key_list[index].press_btn()
		#cur_key_list.append(index)
	#else:
		#key_list[index].up_btn()
	
	if pressed_key_list[index]: return

	key_list[index].press_btn()
	pressed_key_list[index] = true
	cur_key_list.append(index)


var cur_key_list = []
func reset_key():
	for index in cur_key_list:
		key_list[index].disable_btn()
		pressed_key_list[index] = false
	cur_key_list.resize(0)
