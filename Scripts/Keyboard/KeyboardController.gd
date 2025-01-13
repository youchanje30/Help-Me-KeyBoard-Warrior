extends Node

var key_list : Array[IKey]
var cur_key_list : Array[int] = []
var nonekey = preload("res://Scenes/Keys/nonekey.tscn")

var arrow_input = preload("res://Scenes/Arrow.tscn")
var arrow

var enter : key_sprite_controller

func _ready() -> void:
	key_list.resize(27)
	arrow = arrow_input.instantiate()
	add_child(arrow)
	arrow.global_position = Vector2.ZERO

func add_enter_key(key_sprite:key_sprite_controller):
	enter = key_sprite


#region key controll

func add_key(index:int, key_sprite:key_sprite_controller):
	var key = nonekey.instantiate()
	add_child(key)
	key_list[index] = key
	key.set_key(index, key_sprite)

	# 50% to buy
	if randi_range(0, 1) == 0: buy_key(index)


func sell_key(index:int):
	key_list[index].sell_key()

func buy_key(index:int):
	key_list[index].buy_key()

func input_key(index: int, is_pressed : bool):
	if key_list[index].down_key():
		cur_key_list.append(index)

func reset_key():
	if enter != null: enter.down_up_btn()

	for index in cur_key_list:
		key_list[index].up_key()
		key_list[index].shoot_key(arrow.angle, 100)
	cur_key_list.resize(0)
#endregion


#var command_base = preload("res://Scenes/Commands/BaseCommand.tscn")
var command_list = [preload("res://Scenes/Commands/BaseCommand.tscn"),
preload("res://Scenes/Commands/AutoTargetCommand.tscn")]
func GetRandomCommad():
	var command = command_list[randi_range(0, command_list.size()-1)].instantiate()
	add_child(command)
	return command
