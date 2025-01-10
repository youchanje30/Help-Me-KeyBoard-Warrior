extends Node

@export var qwer_layer : Array[Texture2D]
@export var asdf_layer : Array[Texture2D]
@export var zxcv_layer : Array[Texture2D]

@export var off_set_pos = [Vector2(33, 15), Vector2(41, 30), Vector2(49, 45)]

var key_base = preload("res://Scenes/keyboards/keyboard_only_empty_keys.tscn")
var key_prefabs = preload("res://Scenes/testkey.tscn")

# it will fix
var key_list = [["Q","W","E","R","T","Y","U","I","O","P"],
["A", "S", "D", "F", "G", "H", "J", "K", "L"],
["Z", "X", "C", "V", "B", "N", "M"]]

func _ready() -> void:
	set_keyboard()

func _process(delta: float) -> void:
	pass

func set_keyboard():
	add_child(key_base.instantiate())

	var layers = [qwer_layer, asdf_layer, zxcv_layer]
	var cnt = 0
	for layer in layers:
		for i in range(layer.size()):
			#var key = key_prefabs.instantiate()
			#add_child(key)
			#key.set_texture(layer[i])
			#key.set_z_index(cnt+1)
			#key.global_position = off_set_pos[cnt] + Vector2(19 * i, 0)
			var key = generate_key(layer[i], cnt+1, off_set_pos[cnt] + Vector2(19 * i, 0))
			KeyboardController.add_key(key_list[cnt][i].to_ascii_buffer()[0]  - 65, key)
		cnt += 1

func generate_key(texture : Texture2D, z_index : int, position : Vector2):
	var key = key_prefabs.instantiate()
	add_child(key)
	key.set_texture(texture)
	key.set_z_index(z_index)
	key.global_position = position
	return key
