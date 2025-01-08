extends Node


@export var sprite : Sprite2D

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass


func up_btn()->void:
	sprite.region_rect.position = Vector2(82, 0)
	pass

func press_btn()->void:
	sprite.region_rect.position = Vector2(41, 0)
	pass

func disable_btn()->void:
	sprite.region_rect.position = Vector2.ZERO
	pass


var cnt = 0
func _on_timer_timeout() -> void:
	if cnt == 0:
		press_btn()
	elif cnt == 1:
		up_btn()
	else:
		disable_btn()
	cnt = (cnt+1)%3
