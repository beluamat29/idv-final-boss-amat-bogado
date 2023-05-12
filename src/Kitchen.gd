extends Area2D

onready var mainScene = get_node("/root/Main")

func _input(event):
	if event.is_action_pressed("click"):
		print('pasando por cocina')
		mainScene.objectWasPressed(2)
		
		#ver si esto se puede cambiar por una signal
