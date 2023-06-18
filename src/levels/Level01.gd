extends Node

onready var tasksList = $TaskList/ItemsList
onready var stress_bar: Control = $StressBar
onready var furniture: Node2D = $Environment/Entities/Furniture
onready var player: KinematicBody2D = $Environment/Entities/Player
onready var coffeTable: Node2D = $Environment/Entities/CoffeeTable

signal victory
signal game_over

func objectWasPressed(objectId):
	tasksList.objectWasPressed(objectId)
	
func _on_ItemsList_victory():
	emit_signal("victory")

func _on_Time_game_over():
	emit_signal("game_over")

func _on_StressBar_game_over():
	emit_signal("game_over")
		
func _on_GenericFurniture_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		player.set_target()

func _on_GenericFurniture_task_finished(id):
	objectWasPressed(id)
	stress_bar._change_stress_bar(-10)
	player.busy = false

func _on_StressBar_change_stress_signs(value: int):
	player.change_stress_signs(value)
	if(value >= 10):
		coffeTable.showCoffe()

func _on_Child_set_player_target():
	player.set_target()
	
func _on_Child_crying():
	stress_bar.increased_stress = 4
	
func _on_Child_player_baby_toggle(value):
	stress_bar.increased_stress = 1

