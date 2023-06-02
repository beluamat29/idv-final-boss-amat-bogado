extends KinematicBody2D

export (int) var speed = 200

onready var target = position
onready var sprite:Sprite = $Sprite
onready var eyes: Sprite = $Sprite/Eyes
onready var with_baby:bool = false
var velocity:Vector2 = Vector2.ZERO
var stress_level:int = 1
export var eyes1: Texture
export var eyes2: Texture
export var eyes3: Texture 

func _ready():
	$AnimationPlayer.play("squash")

func _process(delta):
	velocity.x = position.direction_to(target).x * speed
	if position.distance_to(target) > 5:
		velocity = move_and_slide(velocity)
		
	
func set_target():
	if !with_baby:
		target = get_global_mouse_position()

func _on_Floor2_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		set_target()
		
func change_stress_signs(value: int):
	if value < 33 && stress_level != 1:
		stress_level = 1
		$AnimationPlayer.play("squash")
		eyes.texture = eyes1
	if value >= 33 && value < 66 && stress_level != 2:
		stress_level = 2
		$AnimationPlayer.play("squash", -1, 2)
		eyes.texture = eyes2
	if value >= 66 && stress_level != 3:
		stress_level = 3
		$AnimationPlayer.play("squash", 0, 1)
		eyes.texture = eyes3


func _on_Child_player_baby_toggle(value):
	print('taking care')
	with_baby = value
