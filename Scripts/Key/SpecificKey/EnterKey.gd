extends Node

@export var texture : Texture2D
@export var z_index : int
@export var offset : Vector2
@export var generator : GenerateKeyboard

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	KeyboardController.add_enter_key(generator.generate_key(texture, z_index, generator.position + offset))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
