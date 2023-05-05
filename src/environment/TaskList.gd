extends Control

const listItem = preload("UI/ListItem.tscn")
onready var list = $ItemList

var listIndex = 0

func _ready():
	addItem("Responder mail del trabajo")
	addItem("Asistir a la reunion de las 10:00 am")
	
	
	
func addItem(text):
	var item = listItem.instance()
	listIndex += 1
	item.addText(text)
	list.add_child(item)
