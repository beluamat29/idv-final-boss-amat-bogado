extends Control

onready var list = $ItemsList
onready var level = get_node("/root/LevelManager/CurrentLevelContainer/Level01")

var listIndex = 0

func _ready():
	var tasks = level.getTasksList()
	for task in tasks:
		addItem(task)
	
func addItem(task):
	listIndex += 1
	list.add_task(task[1], task[0])
