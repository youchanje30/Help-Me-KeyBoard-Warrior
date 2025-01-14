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
		key_list[index].shoot_key(arrow.angle)
	cur_key_list.resize(0)
#endregion


var command_list = [preload("res://Scenes/Commands/BaseShootCommand.tscn")]#,
#preload("res://Scenes/Commands/AutoTargetCommand.tscn")]

var data_path = ["ShootCommands/"]
func GetRandomCommad():
	var index = randi_range(0, 0)
	var command = command_list[index].instantiate()
	var path = "res://CommandDatas/" + data_path[index]
	
	command.set_command(GetRandomFromPath(path))
	
	add_child(command)
	return command


func GetRandomFromPath(path : String):
	var resource_files = DirAccess.get_files_at(path)
	var random_resource = resource_files[randi() % resource_files.size()]
	var data = load(path + random_resource)
	return data
