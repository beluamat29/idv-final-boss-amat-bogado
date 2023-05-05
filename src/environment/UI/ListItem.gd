extends Control

func addText(value):
	get_node("CheckBox").text = value
	rect_min_size = Vector2(150, 40)
