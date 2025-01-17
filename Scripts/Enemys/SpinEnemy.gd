extends IEnemy

var distance : float
var angle : float
@export var speed : float = 25

func _ready() -> void:
	super._ready()
	distance = 200
	angle = global_position.angle_to(Vector2.RIGHT)
	

func move(delta):
	var deg_angle = deg_to_rad(angle)
	var dir = Vector2(cos(deg_angle), sin(deg_angle)).normalized()
	
	var pos = dir * distance
	
	angle += 5 * delta
	distance -= delta * speed
	global_position = pos
