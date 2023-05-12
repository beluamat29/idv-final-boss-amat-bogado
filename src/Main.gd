extends Node

onready var level = $Level1
onready var tasksList = $Environment/TaskList/ItemsList
# Called when the node enters the scene tree for the first time.
func _ready():
	level.initialize()

func getTasksList():
	print(level)
	return level.getTasksList()

func objectWasPressed(objectId):
	tasksList.objectWasPressed(objectId)
	
