extends Node

onready var tasksList = $TaskList/ItemsList
onready var player: KinematicBody2D = $Environment/Entities/Player

signal victory
signal game_over

func getTasksList():
		return [["Regar planta", 0], ["Asistir a la reunion de las 10:00 am", 1], ["Cocinar", 2]]

func objectWasPressed(objectId):
	tasksList.objectWasPressed(objectId)

func _on_Kitchen_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		player.set_target()
		objectWasPressed(2)


func _on_Desk_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		player.set_target()
		objectWasPressed(1)


func _on_Plant_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		player.set_target()
		objectWasPressed(0)

func _on_ItemsList_victory():
	emit_signal("victory")

func _on_Time_game_over():
	emit_signal("game_over")

func _on_StressBar_game_over():
	emit_signal("game_over")

