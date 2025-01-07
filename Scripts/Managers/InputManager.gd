extends Node



func _input(event: InputEvent) -> void:
	#if event is InputEventKey:
		#print(event.keycode )
		
	# input get 65 a, 90 z like ASCII Code
	if event is InputEventKey:
		if 65 <= event.keycode and event.keycode <= 90: # a <= event.keycode <= z
			test_func(event.keycode)
	pass

func _ready() -> void: pass


func test_func(keycode : int):
	print(keycode - 65)
