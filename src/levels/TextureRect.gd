extends Sprite

func _on_StressBar_stress_level_3():
	pass


func _on_StressBar_change_stress_signs(value):
	if value > 40:
		if value > 90:
			material.set_shader_param("spread", value * 0.0009)
		else:
			material.set_shader_param("spread", value * 0.0001)
	
	
	
