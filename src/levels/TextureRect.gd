extends Sprite

func _ready():
	material.set_shader_param("spread",0)


func _on_StressBar_change_stress_signs(value):
	if value > 40:
		if value > 80:
			material.set_shader_param("spread", value * 0.0002)
		else:
			material.set_shader_param("spread", value * 0.0001)
	
	
	
