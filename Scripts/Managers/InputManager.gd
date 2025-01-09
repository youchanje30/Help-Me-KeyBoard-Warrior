extends Node



func _input(event: InputEvent) -> void:
		
	# input get 65 a, 90 z like ASCII Code
	if event is InputEventKey:
		if Input.is_action_just_pressed("ui_accept"):
			KeyboardController.reset_key()
			
		if 65 <= event.keycode and event.keycode <= 90 and not event.echo: # a <= event.keycode <= z
			#test_func(event.echo)
			#print(, )
			var key = event.keycode - 65
			KeyboardController.input_key(key, event.is_pressed())
	pass

func _ready() -> void: pass


func test_func(keycode : int):
	print(keycode - 65)
