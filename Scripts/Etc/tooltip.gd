extends Control

func ItemPopup(slot : Rect2i, item):
	var mouse_pos = get_viewport().get_mouse_position()
	var correction
	if mouse_pos.x <= -get_viewport_rect().size.x/2:
		correction = Vector2i(slot.size.x, 0)
	else:
		correction = -Vector2i(%ItemPopup.size.x, 0)
	%ItemPopup.popup(Rect2i( slot.position + correction + Vector2i(400, 250), %ItemPopup.size ))
	
	%Type.text = item[0]
	%Name.text = item[1]
	%Info.text = item[2]

func HideItemPopup():
	%ItemPopup.hide()
