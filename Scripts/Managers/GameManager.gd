extends Node

var coins : int = 30


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



func buy_btn():
	if not CanUseCoin(10): return
	UseCoin(10)
	KeyboardController.BuyRandomKey()
