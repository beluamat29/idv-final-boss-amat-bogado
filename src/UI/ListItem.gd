extends Control

onready var id

func setId(itemId):
	id = itemId
	
func addText(value):
	get_node("CheckBox").text = value
	rect_min_size = Vector2(150, 40)
	
func markAsCompleted():
	get_node("CheckBox").pressed = true
