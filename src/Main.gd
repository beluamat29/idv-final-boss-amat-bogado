extends Node

onready var level = $Level1

# Called when the node enters the scene tree for the first time.
func _ready():
	level.initialize()

func getTasksList():
	print(level)
	return level.getTasksList()
