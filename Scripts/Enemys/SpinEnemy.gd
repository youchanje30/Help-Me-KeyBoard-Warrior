extends IEnemy

var distance : float
var angle : float
var angle_speed : float
var move_speed : float

func _ready() -> void:
	super._ready()
	distance = 200
	angle = rad_to_deg(global_position.angle_to(Vector2.RIGHT))
	angle_speed = randf_range(-10, 10)
	move_speed = randf_range(3, 7)
	

func move(delta):
	var deg_angle = deg_to_rad(angle)
	var dir = Vector2(cos(deg_angle), sin(deg_angle)).normalized()
	
	var pos = dir * distance
	
	angle += angle_speed * delta
	distance -= move_speed * delta
	global_position = pos
