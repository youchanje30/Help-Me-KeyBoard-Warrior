extends IBullet

@export var sprite : Sprite2D


var _angle : float
var _force : float
var speed : float = 10


func shoot(angle : float=0, force : float=0, damage : float = 0):
	super.shoot(angle, force, damage)
	_angle = angle
	_force = force
	set_rotation(deg_to_rad(-_angle))

func move(delta):
	#_force = clampf(_force-delta, 1, 5)
	var rad = deg_to_rad(-_angle)
	var vec = Vector2(cos(rad), sin(rad)).normalized()
	translate(vec * delta * speed * _force)
