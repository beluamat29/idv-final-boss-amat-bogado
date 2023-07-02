extends Area2D


func _on_mouse_entered():
	material.set_shader_param("width", 8)

func _on_mouse_exited():
	material.set_shader_param("width", 0)
