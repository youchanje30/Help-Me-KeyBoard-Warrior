extends Node

@export var key_texture : Texture2D
@export var sprite : Sprite2D

var region_x_size : int = 0




func _ready() -> void:
	set_sprite_region()

#func _process(delta: float) -> void:
	#pass


func set_sprite_region():
	sprite.region_enabled = true
	if key_texture != null: sprite.texture = key_texture
	var texture_size_x = sprite.texture.get_size().x
	var texture_size_y = sprite.texture.get_size().y
	region_x_size = texture_size_x / 3 # it always cut by 3
	var region_rect_size = Vector2(region_x_size, texture_size_y)
	sprite.region_rect.size = region_rect_size
	sprite.region_rect.position = Vector2.ZERO



#region Change Sprite
func up_btn()->void:
	sprite.region_rect.position = Vector2(region_x_size*2, 0)

func press_btn()->void:
	sprite.region_rect.position = Vector2(region_x_size*1, 0)

func disable_btn()->void:
	sprite.region_rect.position = Vector2.ZERO
#endregion

var cnt = 0
func _on_timer_timeout() -> void:
	if cnt == 0:
		press_btn()
	elif cnt == 1:
		up_btn()
	else:
		disable_btn()
	cnt = (cnt+1)%3
