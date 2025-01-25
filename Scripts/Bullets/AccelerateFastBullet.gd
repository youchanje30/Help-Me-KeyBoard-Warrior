extends IBullet

@export var sprite : Sprite2D

var _angle : float
var _force : float
var _vec : Vector2 = Vector2.UP

var can_increase : bool = false

# 일정 시간 이후에 가속하는 탄으로 변경
# 가속의 최대치가 있고, 초반에 조금 더 많이 빠르게 증가하게 하자.
# Curve 사용이 필요해 보인다

func shoot(angle : float=0, force : float=0, damage : float = 0, data = {}):
	super.shoot(angle, force, damage)
	_angle = angle
	_force = force
	set_rotation(deg_to_rad(-_angle))
	var rad = deg_to_rad(-_angle)
	_vec = Vector2(cos(rad), sin(rad)).normalized()

	await get_tree().create_timer(0.75).timeout
	can_increase = true

func move(delta):
	if can_increase:
		var increase = clampf(delta * _force * 2, 50, 2000)
		_force = clampf(increase + _force, 1, 10000)
	translate(_vec * delta * _force)
