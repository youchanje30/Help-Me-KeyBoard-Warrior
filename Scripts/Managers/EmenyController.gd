extends Node

var enemy_base = preload("res://Scenes/Enemys/BaseEnemy.tscn")
var distance = 300
func _ready() -> void:
	
	for i in range(10):	
		var spawn_pos = Vector2(randf_range(0, 1), randf_range(0, 1)).normalized()
		var enemy = enemy_base.instantiate()
		add_child(enemy)
	
		enemy.global_position = spawn_pos * distance
		enemy._ready()
