extends Node

@export var qwer_layer : Array[Texture2D]
@export var asdf_layer : Array[Texture2D]
@export var zxcv_layer : Array[Texture2D]

@export var off_set_pos = [Vector2(33, 15), Vector2(41, 30), Vector2(49, 45)]

var key_base = preload("res://Scenes/keyboard_base.tscn")
var key_prefabs = preload("res://Scenes/testkey.tscn")

func _ready() -> void:
	set_keyboard()
	




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass






func set_keyboard():
	add_child(key_base.instantiate())

	var layers = [qwer_layer, asdf_layer, zxcv_layer]
	var cnt = 0
	for layer in layers:
		for i in range(layer.size()):
			var key = key_prefabs.instantiate()
			add_child(key)
			key.set_texture(layer[i])
			key.global_position = off_set_pos[cnt] + Vector2(19 * i, 0)
			#print(off_set_pos[cnt] + Vector2(19 * i, 0))
			
			
		cnt += 1
