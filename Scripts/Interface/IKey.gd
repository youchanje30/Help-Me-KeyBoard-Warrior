extends Node
class_name IKey

var command : key_command
var key : key_controller
var is_pressed : bool = false
var is_owned : bool = false


func buy_key(): pass
func sell_key(): pass
func up_key():
	key.disable_btn()
	is_pressed = false
