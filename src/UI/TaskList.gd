extends Control

onready var list = $ItemsList
onready var furniture = get_node("/root/LevelManager/CurrentLevelContainer/Level01/Environment/Entities/Furniture")

func _ready():
	var tasks: Dictionary = furniture.get_tasks()
	for taskID in tasks.keys():
		addItems(tasks[taskID], taskID)
	
func addItems(tasks, taksID):
	for task in tasks:
		list.add_task(taksID, task)
