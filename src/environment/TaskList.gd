extends Control

const listItem = preload("UI/ListItem.tscn")

onready var list = $ItemsList
onready var level = get_node("/root/Main/Level1")

var listIndex = 0

func _ready():
	var tasks = level.getTasksList()
	for task in tasks:
		addItem(task)
	
func addItem(task):
	listIndex += 1
	list.add_task(task[1], task[0])
