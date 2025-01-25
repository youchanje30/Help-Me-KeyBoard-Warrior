extends Node

var enemy_path = "res://Scenes/Enemys/"

var distance = 300

var enemys : Array[IEnemy]
var stage_cnt : int = 1

func _ready() -> void: pass


func SpawnEnemys(cnts : int):
	#for i in range(cnts): SpawnEnemy()
	var data = load("res://StageDatas/Stage"+ str(stage_cnt) +".tres")
	stage_cnt += 1
	SpawnEnemysByData(data)

func SpawnEnemysByData(data : StageData):
	for i in range(data.time.size()):
		for j in range(data.time[i]):
			var spawn_pos = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
			var enemy = load(data.enemy[i]).instantiate()
			add_child(enemy)
			enemys.append(enemy)
			enemy.global_position = spawn_pos * (distance + randf_range(-100, 100))
			enemy._ready()


func SpawnEnemy():
	var spawn_pos = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	var enemy = GetRandomFromPath(enemy_path)
	add_child(enemy)
	enemys.append(enemy)
	enemy.global_position = spawn_pos * (distance + randf_range(-100, 100))
	enemy._ready()


func get_random_enemy_pos():
	if enemys.size() != 0: return enemys[randi_range(0, enemys.size()-1)].position
	return Vector2.UP

func get_nearest_enemy_pos():
	if enemys.size() == 0: return Vector2.UP
	
	var min_pos = Vector2.ZERO
	var min_distance = (enemys[0].position.x * enemys[0].position.x) + (enemys[0].position.y * enemys[0].position.y)
	for enemy in enemys:
		var x = enemy.position.x
		var y = enemy.position.y
		var cur_distance = x*x + y*y
		if min_distance < cur_distance: continue
		min_distance = cur_distance
		min_pos = enemy.position
	
	return min_pos

func Remove_Enemy(enemy):
	enemys.erase(enemy)
	enemy.queue_free()
	GameManager.RewardEnemy()
	
	if enemys.size() != 0: return
	StageManager.EndStage()


func GetRandomFromPath(path : String):
	var resource_files = DirAccess.get_files_at(path)
	var random_resource = resource_files[randi() % resource_files.size()]
	var data = load(path + random_resource).instantiate()
	return data
