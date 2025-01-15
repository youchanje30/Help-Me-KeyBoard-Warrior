extends Node

var cur_stage = 0

func _ready() -> void:
	StageStart()

func StageStart():
	#region Spawn Enemy
	var spawn_enemy_cnt = cur_stage * cur_stage + cur_stage + 4
	EnemyController.SpawnEnemys(spawn_enemy_cnt)
	#endregion

	#region End Of Stage Process
	cur_stage += 1
	#endregion

func EndStage():
	await get_tree().create_timer(10).timeout
	StageStart()
