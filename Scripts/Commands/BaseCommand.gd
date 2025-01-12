extends key_command

var bullet_base = preload("res://Scenes/Bullets/BaseBullet.tscn")

func set_command()->void: pass
func execute(angle : float = 0, force : float = 0, damage : float = 0)->void:
	var bullet = bullet_base.instantiate()
	add_child(bullet)
	
	bullet.global_position = Vector2.ZERO
	bullet.shoot(angle, force, damage)
