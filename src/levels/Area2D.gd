extends Area2D

onready var light: Light2D = $Light2D4
onready var shine: Light2D = $Light2D
onready var sound: AudioStreamPlayer = $SwitchSound
var can_turn_on: bool = false
var selected: bool = false
var body_entered: bool = false

signal _on_selected()

func _process(delta):
	if !light.is_visible_in_tree() && can_turn_on && selected && body_entered:
		sound.play()
		shine.hide()
		light.show()
		selected = false

func _on_Switch_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed && can_turn_on):
		selected = true

func _on_Time_end_sunset():
	can_turn_on = true
	shine.show()


func _on_Switch_mouse_entered():
	if !light.is_visible_in_tree() && can_turn_on:
		emit_signal("_on_selected")


func _on_Switch_body_entered(body):
	body_entered = true
	
func _on_Switch_body_exited(body):
	body_entered = false
