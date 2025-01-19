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
	_sprite_controller.own_setting(is_owned)

func buy_key():
	is_owned = true
	
	# for test command
	command = KeyboardController.GetRandomCommad()
	command.connect("ExecuteChange", _sprite_controller.highlight_effect)
	_sprite_controller.own_setting(is_owned)
	_sprite_controller.connect("Mouse", tooltip)
	

func sell_key():
	is_owned = false
	_sprite_controller.own_setting(is_owned)

func up_key():
	_sprite_controller.disable_btn()
	is_pressed = false

func down_key():
	# 소유 중 일때만
	if not is_owned: return false
	# 누른 상태가 아닐 때만
	if is_pressed: return false
	# 가능한 상태일 때만
	if not command.can_execute: return false
	
	is_pressed = true
	_sprite_controller.press_btn()
	return true

func shoot_key(angle):#, force):
	if not is_owned: return
	#command.execute(angle, force, DamageController.GetDamage(_index))
	command.execute(angle, DamageController.GetDamage(_index))

func tooltip(is_in : bool):
	pass
