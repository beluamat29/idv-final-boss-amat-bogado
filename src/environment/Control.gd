extends Control

export var stress_bar_path: NodePath
	
func _change_stress_bar(value) -> void:
	var stress_bar: Range = get_node(stress_bar_path)
	stress_bar.value = stress_bar.value + value


func _on_Countdown_timeout():
	_change_stress_bar(1)
