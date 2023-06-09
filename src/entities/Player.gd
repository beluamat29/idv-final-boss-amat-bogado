extends KinematicBody2D

export (int) var speed = 200

onready var target = position
onready var sprite:AnimatedSprite = $Sprite
onready var eyes: Sprite = $Sprite/Eyes
onready var with_baby:bool = false
onready var canDrinkCoffee: bool = false
onready var thought: Sprite = $Thought
onready var think: Sprite = $Think
onready var sfx_sound: AudioStreamPlayer = $SFX
var velocity:Vector2 = Vector2.ZERO
var stress_level:int = 1
var busy: bool = false
var coffeeWasClicked: bool = false
onready var drinking: bool = false
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
signal coffee_finished()

func _ready():
	eyes_front = eyes1
	eyes_left = eyes1_left
	eyes_right = eyes1_right
	$AnimationPlayer.play("squash")

func _physics_process(delta):
	if(drinking):
		drinkCoffee()
	else:
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
	coffeeWasClicked = false 
	if !with_baby:
		target = get_global_mouse_position()

func _on_Floor2_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		set_target()
		
func change_stress_signs(value: int):
	if value < 33 && stress_level != 1:
		setStressLevel1()
	if value >= 33 && value < 66 && stress_level != 2:
		setStressLevel2()
	if value >= 66 && stress_level != 3:
		setStressLevel3()

func setStressLevel1():
	stress_level = 1
	$AnimationPlayer.play("squash")
	eyes_front = eyes1
	eyes_left = eyes1_left
	eyes_right = eyes1_right
	eyes.texture = eyes1
	
func setStressLevel2():
	stress_level = 2
	$AnimationPlayer.play("squash", -1, 2)
	eyes_front = eyes2
	eyes_left = eyes2_left
	eyes_right = eyes2_right	

func setStressLevel3():
	stress_level = 3
	$AnimationPlayer.play("squash", 0, 4)
	eyes_front = eyes3
	eyes_left = eyes3_left
	eyes_right = eyes3_right	
	
func _on_Child_player_baby_toggle(value):
	with_baby = value


func _on_task_in_progress(probability):
	busy = true


func _on_Timer_timeout():
	thought.hide()

func coffeIsAvailable(): 
	think.show_thought("res://assets/textures/environment/coffee.png")
	canDrinkCoffee = true

func _on_Coffee_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed && canDrinkCoffee):
		set_target()
		coffeeWasClicked = true

func drinkCoffee():
	if !sfx_sound.playing:
		sfx_sound.play()
	eyes.texture = eyes_front
	sprite.play("drinking")
		
func finishCoffee():
	canDrinkCoffee = false
	coffeeWasClicked = false
	drinking = false
	emit_signal("coffee_finished")

	
func _on_Coffee_body_entered(body):
	if(canDrinkCoffee && coffeeWasClicked):
		drinking = true 
		yield(get_tree().create_timer(6), "timeout")
		finishCoffee()
