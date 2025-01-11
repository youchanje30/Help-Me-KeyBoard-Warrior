extends IBullet

var _angle : float
var _force : float
var speed : float = 10

func shoot(angle : float=0, force : float=0):
	super.shoot(angle, force)
	_angle = angle
	_force = force
func move(delta):
	_force = clampf(_force-delta, 1, 5)
	
	var vec = Vector2(sin(_angle), cos(_angle))
	translate(vec * delta * speed)
