extends GPUParticles2D



func _on_finished() -> void:
	self.visible = false


func _on_visibility_changed() -> void:
	if self.visible: restart()
	else: EffectManager.AddEffect(self, 0)
