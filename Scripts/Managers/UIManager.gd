extends Node
class_name UIManager

@export var _buy_btn : Button
@export var _coin_label : Label
@export var ui_control_inhert: Control


func ChangeValueData():
	_coin_label.text = "coins : " + str(GameManager.coins)
	_buy_btn.text = str(GameManager.spawn_coins)

func _ready() -> void:
	ChangeValueData()

func buy_btn():
	if not GameManager.CanUseCoin(GameManager.spawn_coins): return
	GameManager.BuyKey()
