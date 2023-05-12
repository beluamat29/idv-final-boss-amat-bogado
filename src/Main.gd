extends Node

onready var level = $Level1
onready var tasksList = $Environment/TaskList/ItemsList
# Called when the node enters the scene tree for the first time.
func _ready():
	level.initialize()

func getTasksList():
		return [["Regar planta", 0], ["Asistir a la reunion de las 10:00 am", 1], ["Cocinar", 2]]

func objectWasPressed(objectId):
	tasksList.objectWasPressed(objectId)

func _on_Kitchen_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		objectWasPressed(2)


func _on_Desk_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		objectWasPressed(1)


func _on_Plant_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		objectWasPressed(0)
