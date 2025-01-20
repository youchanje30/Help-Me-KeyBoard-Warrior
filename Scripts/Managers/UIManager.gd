extends Node
class_name UIManager

@export var _coin_label : Label
@export var ui_control_inhert: Control


func ChangeValueData():
	_coin_label.text = "coins : " + str(GameManager.coins)

func _ready() -> void:
	ChangeValueData()

func buy_btn():
	if not GameManager.CanUseCoin(GameManager.spawn_coins): return
	GameManager.BuyKey()

func make_custom_tooltip(data):
	# data to string
	var data_string = "123 32 123"
	ui_control_inhert._make_custom_tooltip(data_string)
