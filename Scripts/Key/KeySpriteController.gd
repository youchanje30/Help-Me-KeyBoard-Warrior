extends Node
class_name key_sprite_controller

@export var key_texture : Texture2D
@export var sprite : Sprite2D
@export var highlight_sprite : Sprite2D

@export var own_modulate : Color = Color.WHITE
@export var unown_modulate : Color = Color.BLACK
@export var tooltip_loader : Control

var region_x_size : int = 0

func _ready() -> void:
	set_sprite_region()

#func _process(delta: float) -> void:
	#pass

func own_setting(is_own : bool):
	sprite.modulate = own_modulate if is_own else unown_modulate
	highlight_effect(is_own)

func set_texture(text):
	key_texture = text
	set_sprite_region()

func set_sprite_region():
	if key_texture != null: sprite.texture = key_texture
	else: return

	sprite.region_enabled = true
	var texture_size_x = sprite.texture.get_size().x
	var texture_size_y = sprite.texture.get_size().y
	region_x_size = texture_size_x / 3 # it always cut by 3
	var region_rect_size = Vector2(region_x_size, texture_size_y)
	sprite.region_rect.size = region_rect_size
	sprite.region_rect.position = Vector2.ZERO



#region Change Sprite
func down_up_btn():
	press_btn()
	await get_tree().create_timer(0.05).timeout
	disable_btn()
	

func up_btn()->void:
	sprite.region_rect.position = Vector2(region_x_size*2, 0)

func press_btn()->void:
	up_btn()
	await get_tree().create_timer(0.05).timeout
	sprite.region_rect.position = Vector2(region_x_size*1, 0)


func disable_btn()->void:
	up_btn()
	await get_tree().create_timer(0.05).timeout
	sprite.region_rect.position = Vector2.ZERO

func highlight_effect(is_highlight:bool)->void:
	highlight_sprite.visible = is_highlight
#endregion
