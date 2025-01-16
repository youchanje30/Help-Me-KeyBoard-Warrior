extends Node


@export var ui_controller : UIManager

var coins : int = 30:
	set(val):
		coins = val
		ui_controller.ChangeValueData()

func _ready() -> void:
	ui_controller = get_tree().get_root().get_node("TestMain").get_node("UI")

#region 재화 관련
func UseCoin(val):
	coins -= val
	
func CanUseCoin(val):
	return coins >= val

func AddCoin(val):
	coins += val
#endregion

#region 적 골드 관련
func RewardEnemy():
	AddCoin(3)
#endregion
