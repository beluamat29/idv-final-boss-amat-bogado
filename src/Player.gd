extends KinematicBody2D

export (int) var speed = 100

onready var target = position
var velocity = Vector2()

func _process(delta):
	velocity = position.direction_to(target) * speed
	look_at(target)
	if position.distance_to(target) > 5:
		velocity = move_and_slide(velocity)
		
		
func _input(event):
	if event.is_action_pressed("click"):
		target = get_global_mouse_position()
		

