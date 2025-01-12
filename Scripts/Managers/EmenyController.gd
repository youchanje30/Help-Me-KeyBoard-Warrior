extends Node

var enemy_base = preload("res://Scenes/Enemys/BaseEnemy.tscn")
var distance = 300

var enemys : Array[IEnemy]

func _ready() -> void:
	
	for i in range(30):	
		var spawn_pos = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
		var enemy = enemy_base.instantiate()
		add_child(enemy)
		enemys.append(enemy)
		enemy.global_position = spawn_pos * distance
		enemy._ready()


func get_random_enemy_pos():
	return enemys[randi_range(0, enemys.size())].position
