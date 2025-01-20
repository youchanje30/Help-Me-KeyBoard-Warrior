extends Control


func _make_custom_tooltip(data_string: String) -> Object:
	var tooltip = preload("res://Scenes/Tooltip/tooltip.tscn").instantiate()
	tooltip.Config(data_string)
	return tooltip
