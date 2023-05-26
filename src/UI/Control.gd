extends Control

export var stress_bar_path: NodePath

signal game_over
	
func _change_stress_bar(value) -> void:
	var stress_bar: Range = get_node(stress_bar_path)
	if stress_bar.value < 100:
		stress_bar.value = stress_bar.value + value
	else:
		emit_signal("game_over")


func _on_Countdown_timeout():
	_change_stress_bar(1)
