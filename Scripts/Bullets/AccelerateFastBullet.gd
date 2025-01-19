extends IBullet

@export var sprite : Sprite2D

var _angle : float
var _force : float
var _vec : Vector2 = Vector2.UP

func shoot(angle : float=0, force : float=0, damage : float = 0, data = {}):
	super.shoot(angle, force, damage)
	_angle = angle
	_force = force
	set_rotation(deg_to_rad(-_angle))
	var rad = deg_to_rad(-_angle)
	_vec = Vector2(cos(rad), sin(rad)).normalized()

func move(delta):
	_force += delta * _force
	translate(_vec * delta * _force)
