extends Node


# 이 모든걸 한 곳에 담는 클래스가 있으면 좋겠는데..
var key_list : Array[key_controller]
var pressed_key_list : Array[bool]
var owned_key_list : Array[bool]


var key_lists : Array[IKey]

var cur_key_list : Array[int] = []


func _ready() -> void:
	key_list.resize(27)
	pressed_key_list.resize(27)
	pressed_key_list.fill(false)

#region key controll
func add_key(index:int, key:key_controller):
	key_list[index] = key

#func remove_key(index:int):
	#if not is_exist_key(index): return
	#var key = key_list[index]
	#key.queue_free()
	#key_list[index] = null
#
#func is_exist_key(index:int)->bool:
	#return key_list[index] != null and not key_list[index].is_queued_for_deletion()
#endregion

func input_key(index: int, is_pressed : bool):
	# 소유중인 키에 한하여
	#if not is_exist_key(index): return
	# 누르고 있지 않은 키에 한하여
	if pressed_key_list[index]: return

	key_list[index].press_btn()
	pressed_key_list[index] = true
	cur_key_list.append(index)


func reset_key():
	for index in cur_key_list:
		key_list[index].disable_btn()
		pressed_key_list[index] = false
	cur_key_list.resize(0)
