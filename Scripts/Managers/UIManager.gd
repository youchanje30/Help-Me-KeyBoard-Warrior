extends Node
class_name UIManager

@export var _coin_label : Label

func ChangeValueData():
	_coin_label.text = "coins : " + str(GameManager.coins)

func _ready() -> void:
	ChangeValueData()

func buy_btn():
	if not GameManager.CanUseCoin(10): return
	GameManager.UseCoin(10)
	KeyboardController.BuyRandomKey()
