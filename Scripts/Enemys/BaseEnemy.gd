extends IEnemy

var move_vec : Vector2
var time : int = 20
var speed : float = 3

var distance : float = 1

func _ready() -> void:
	super._ready()
	move_vec = -self.global_position.normalized()
	distance = global_position.distance_to(Vector2.ZERO)
	speed = distance / time
# 속력 = 거리 / 시간 공식에 의해, 정확히 time 시간 이후에 플레이어의 위치에 도달함

func move(delta):
	translate(move_vec * speed * delta)
