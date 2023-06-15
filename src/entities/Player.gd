extends KinematicBody2D

export (int) var speed = 200

onready var target = position
onready var sprite:AnimatedSprite = $Sprite
onready var eyes: Sprite = $Sprite/Eyes
onready var with_baby:bool = false
var velocity:Vector2 = Vector2.ZERO
var stress_level:int = 1
var busy: bool = false
export var eyes1: Texture
export var eyes2: Texture
export var eyes3: Texture
export var eyes1_left: Texture
export var eyes1_right: Texture
export var eyes2_left: Texture
export var eyes2_right: Texture
export var eyes3_left: Texture
export var eyes3_right: Texture
var eyes_front: Texture
var eyes_left: Texture
var eyes_right: Texture

signal busy()

func _ready():
	eyes_front = eyes1
	eyes_left = eyes1_left
	eyes_right = eyes1_right
	$AnimationPlayer.play("squash")

func _physics_process(delta):
	velocity.x = position.direction_to(target).x * speed
	if abs(position.x - target.x) > 5:
		velocity = move_and_slide(velocity)
		if target.x - position.x < 0:
			sprite.play("walk_left")
			eyes.show()
			eyes.texture = eyes_right
		else:
			sprite.play("walk_right")
			eyes.show()
			eyes.texture = eyes_left
	elif busy || with_baby:
		sprite.play("busy")
		eyes.hide()
	else:
		sprite.play("default")
		eyes.show()
		eyes.texture = eyes_front
	
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
		eyes_front = eyes1
		eyes_left = eyes1_left
		eyes_right = eyes1_right
		eyes.texture = eyes1
	if value >= 33 && value < 66 && stress_level != 2:
		stress_level = 2
		$AnimationPlayer.play("squash", -1, 2)
		eyes_front = eyes2
		eyes_left = eyes1_left
		eyes_right = eyes1_right
	if value >= 66 && stress_level != 3:
		stress_level = 3
		$AnimationPlayer.play("squash", 0, 4)
		eyes_front = eyes3
		eyes_left = eyes1_left
		eyes_right = eyes1_right


func _on_Child_player_baby_toggle(value):
	with_baby = value


func _on_task_in_progress(probability):
	busy = true
