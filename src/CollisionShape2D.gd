extends CollisionShape2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input_event(viewport, event, shape_idx):
	print('fsajsfbajkbfva')
	if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT and event.pressed:
				print("clicked escritorio")
