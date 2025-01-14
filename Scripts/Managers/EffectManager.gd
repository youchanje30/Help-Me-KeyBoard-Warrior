extends Node
#class_name EffectManager

var effect_prefabs = [preload("res://Scenes/Effects/explosion.tscn")]

var remain_effect = [[]]

#func _ready() -> void:
	#remain_effect.resize(1)

func SetEffect(id, pos):
	var effect = GetEffect(id)
	effect.global_position = pos
	effect.visible = true

func GetEffect(id):
	if remain_effect[id].size() > 0:
		return remain_effect[id].pop_back()
	
	var effect = effect_prefabs[id].instantiate()
	add_child(effect)
	return effect

func AddEffect(effect, id):
	remain_effect[id].append(effect)
