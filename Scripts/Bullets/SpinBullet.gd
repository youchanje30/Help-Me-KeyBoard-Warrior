extends IBullet

var _angle : float
var _force : float
var _vec : Vector2 = Vector2.UP

var left : float = 0
var right : float = 0

func shoot(angle : float=0, force : float=0, damage : float = 0, data = {}):
	super.shoot(angle, force, damage)
	_angle = -angle
	_force = force
	
	left = _angle - 30
	right = _angle + 45
	var rad = deg_to_rad(left)
	set_rotation(rad)
	var _vec = Vector2(cos(rad), sin(rad)).normalized()

func move(delta):
	_angle = clampf(_angle + delta * 40, left, right)
	var rad = deg_to_rad(_angle)
	_vec = Vector2(cos(rad), sin(rad)).normalized()
	set_rotation(rad)
	translate(_vec * delta * _force) # speed * _force)
	
