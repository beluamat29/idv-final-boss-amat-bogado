extends Control

const listItem = preload("UI/ListItem.tscn")
onready var list = $ItemList
onready var level = get_node("/root/Main/Level1")

var listIndex = 0

func _ready():
	var tasks = level.getTasksList()
	for task in tasks:
		addItem(task)
	
func addItem(text):
	var item = listItem.instance()
	listIndex += 1
	item.addText(text)
	list.add_child(item)
