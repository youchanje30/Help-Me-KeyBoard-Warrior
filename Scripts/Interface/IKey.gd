extends Node
class_name IKey

var _index : int = 0
var command : key_command
var _sprite_controller : key_sprite_controller
var is_pressed : bool = false
var is_owned : bool = false

func set_key(index : int, sprite_controller : key_sprite_controller):
	_sprite_controller = sprite_controller
	_index = index

func buy_key():
	is_owned = true
	
	# for test command
	command = KeyboardController.GetRandomCommad()

func sell_key():
	is_owned = false

func up_key():
	_sprite_controller.disable_btn()
	is_pressed = false

func down_key():
	# 소유 중 일때만
	if not is_owned: return false
	# 누른 상태가 아닐 때만
	if is_pressed: return false
	
	is_pressed = true
	_sprite_controller.press_btn()
	return true

func shoot_key(angle, force):
	if not is_owned: return
	command.execute(angle, force, DamageController.GetDamage(_index))
	
