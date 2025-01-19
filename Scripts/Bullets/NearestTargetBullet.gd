extends IBullet

var _force : float = 0
var speed : float = 10
var vec : Vector2 = Vector2.UP

func shoot(angle : float=0, force : float=0, damage : float = 0, data = {}):
	super.shoot(angle, force, damage)
	_force = force
	var pos = EnemyController.get_nearest_enemy_pos()
	vec = (pos - position).normalized()

func move(delta):
	translate(vec * delta * _force)# * speed 
