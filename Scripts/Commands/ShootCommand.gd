extends key_command


func execute(angle : float = 0, force : float = 0, damage : float = 0)->void:
	super.execute(angle, force, damage)
	for path in _data.spawn_data:
		
		var bullet = load(path).instantiate()
		add_child(bullet)
		
		bullet.global_position = Vector2.ZERO
		bullet.shoot(angle, force, damage)
