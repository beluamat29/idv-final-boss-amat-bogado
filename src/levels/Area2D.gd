extends Area2D

onready var light: Light2D = $Light2D4
onready var shine: Light2D = $Light2D
var can_turn_on: bool = false

signal _on_selected()

func _on_Switch_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		if !light.is_visible_in_tree() && can_turn_on:
			shine.hide()
			light.show()
		else:
			light.hide()
	


func _on_Time_end_sunset():
	can_turn_on = true
	shine.show()


func _on_Switch_mouse_entered():
	if !light.is_visible_in_tree() && can_turn_on:
		emit_signal("_on_selected")
