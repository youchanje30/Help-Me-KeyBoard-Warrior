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

func sell_key(index:int):
	key_list[index].sell_key()

func buy_key(index:int):
	key_list[index].buy_key()

func input_key(index: int, is_pressed : bool):
	if key_list[index].down_key():
		cur_key_list.append(index)

func reset_key():
	if enter != null: enter.down_up_btn()

	var buff_list = []
	var shoot_list = []

	for index in cur_key_list:
		if key_list[index].command is BuffCommand: buff_list.append(index)
		else: shoot_list.append(index)

	for index in buff_list + shoot_list:
		key_list[index].up_key()
		key_list[index].shoot_key(arrow.angle)

	#region End of EnterKey
	cur_key_list.resize(0)
	DamageController.ResetDamage()
	#endregion
#endregion


func BuyRandomKey():
	var i = randi_range(0, 25)
	while key_list[i].is_owned:
		i = randi_range(0, 25)
	buy_key(i)

var command_list = [preload("res://Scenes/Commands/BaseShootCommand.tscn"),
preload("res://Scenes/Commands/BaseBuffCommand.tscn")]

var data_path = ["ShootCommands/", "BuffCommands/"]
func GetRandomCommad():
	var index = randi_range(0, command_list.size()-1)
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
