extends Area2D

onready var mainScene = get_node("/root/Main")

func _input(event):
	if event.is_action_pressed("click"):
		print('pasando por desk')
		mainScene.objectWasPressed(1)
