extends Control

const listItem = preload("UI/ListItem.tscn")

onready var list = $ItemsList
onready var level = get_node("/root/Level01")

var listIndex = 0

func _ready():
	var tasks = [["Regar planta", 0], ["Asistir a la reunion de las 10:00 am", 1], ["Cocinar", 2]]
	for task in tasks:
		addItem(task)
	
func addItem(task):
	listIndex += 1
	list.add_task(task[1], task[0])
