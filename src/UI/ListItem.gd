extends Control

onready var id

func setId(itemId):
	id = itemId
	
func addText(value):
	var check_box = get_node("CheckBox")
	check_box.text = value
	rect_min_size = Vector2(150, 40)
	
func markAsCompleted():
	get_node("CheckBox").pressed = true
