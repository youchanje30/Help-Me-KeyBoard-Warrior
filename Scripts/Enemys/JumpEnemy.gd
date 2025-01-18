extends IEnemy

var move_vec : Vector2
@export var speed : float = 50
@export var speed_curve : Curve
var cur_time : float

func _ready() -> void:
	super._ready()
	move_vec = -self.global_position.normalized()
	cur_time = 0

func move(delta):
	var time = clampf(cur_time + delta, 0, 1)
	var speed = speed_curve.sample(time)
	translate(move_vec * 50 * speed * delta)
	cur_time = time if time < 1 else 0
