extends key_command
class_name BuffCommand

func execute(angle : float = 0, damage : float = 0)->void:
	super.execute(angle, damage)
	for i in range(_data.fix_data.size()):
		var index = int(i)
		DamageController.damage_buff(index, _data.force_data[index])
