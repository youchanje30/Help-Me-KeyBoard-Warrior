extends key_command


func execute(angle : float = 0, damage : float = 0)->void:#force : float = 0, damage : float = 0)->void:
	super.execute(angle, damage)
	
	for i in range(_data.spawn_data.size()):
		var path = _data.spawn_data[i]
		var _force = _data.force_data[i]
		
		var bullet = load(path).instantiate()
		add_child(bullet)
		
		bullet.global_position = Vector2.ZERO
		bullet.shoot(angle, _force, damage)
