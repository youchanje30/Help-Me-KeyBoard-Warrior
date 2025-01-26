extends Node

var spawn_coins : int = 10:
	set(val):
		spawn_coins = val
		UiManager.ChangeValueData()

var coins : int = 3000:
	set(val):
		coins = val
		UiManager.ChangeValueData()

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

func BuyKey():
	UseCoin(spawn_coins)
	KeyboardController.BuyRandomKey()
	spawn_coins += 10
