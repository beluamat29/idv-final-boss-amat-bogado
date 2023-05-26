extends Node2D

class_name Furniture

func get_tasks():
	var tasks: Dictionary = {}
	var furtinures = get_children()
	for furniture in furtinures:
		tasks[furniture.id] = furniture.tasks
	return tasks
