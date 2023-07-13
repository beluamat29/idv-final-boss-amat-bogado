extends Control

export var stress_bar_path: NodePath
var increased_stress = 1

onready var eyes:Sprite = $Eyes

export var eyes1: Texture
export var eyes2: Texture
export var eyes3: Texture

signal game_over
signal change_stress_signs(value)
	
func _ready():
	eyes.texture = eyes1
	
func _change_stress_bar(value) -> void:
	var stress_bar: Range = get_node(stress_bar_path)
	if stress_bar.value < 100:
	
		stress_bar.value = stress_bar.value + value
		
		
		eyes.position.x = max(0, eyes.position.x + value*3)
		emit_signal("change_stress_signs", stress_bar.value)
		
		if stress_bar.value < 33 && eyes.texture != eyes1:
			eyes.texture = eyes1
		if stress_bar.value >= 33 && stress_bar.value < 66 && eyes.texture != eyes2:
			eyes.texture = eyes2
		if stress_bar.value >= 66 && eyes.texture != eyes3:
			eyes.texture = eyes3
		
	else:
		emit_signal("game_over")

func _on_Player_coffee_finished():
	_change_stress_bar(-32)

func _on_Timer_timeout():
	_change_stress_bar(increased_stress)
