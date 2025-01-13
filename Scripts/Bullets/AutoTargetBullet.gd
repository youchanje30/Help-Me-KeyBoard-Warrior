extends IBullet

var _force : float
var speed : float = 3
var vec : Vector2 = Vector2.UP

func shoot(angle : float=0, force : float=0, damage : float = 0):
	super.shoot(angle, force, damage)
	_force = force
	var pos = EnemyController.get_random_enemy_pos()
	vec = (pos - position).normalized()

func move(delta):
	translate(vec * delta * speed * _force)
