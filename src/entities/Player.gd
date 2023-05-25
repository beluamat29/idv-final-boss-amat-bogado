extends KinematicBody2D

export (int) var speed = 200

onready var target = position
var velocity:Vector2 = Vector2.ZERO

func _process(delta):
	velocity.x = position.direction_to(target).x * speed
	if position.distance_to(target) > 5:
		velocity = move_and_slide(velocity)
		
		
func _input(event):
	if event.is_action_pressed("click"):
		target = get_global_mouse_position()

