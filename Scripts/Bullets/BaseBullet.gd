extends IBullet
@export var sprite : Sprite2D

var _angle : float
var _force : float
var speed : float = 10

func shoot(angle : float=0, force : float=0):
	super.shoot(angle, force)
	_angle = angle
	_force = force
	sprite.set_rotation(_angle)
	print(_angle)

func move(delta):
	_force = clampf(_force-delta, 1, 5)
	var vec = Vector2(cos(_angle), sin(_angle))
	translate(vec * delta * speed * _force)
