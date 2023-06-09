extends Area2D

export var id: int = 1
onready var sprite: Sprite = $Sprite
onready var taskFinishedSprite = $TaskFinishedSprite
onready var animation = $Animation
onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D
export var texture: Texture
var task_activated: bool = false
var task_in_progress: bool = false
var body_entered: bool = false
var player: KinematicBody2D
export var tasks: Array = []
export var probability: int = 10
export var sound: AudioStream
signal selected()
signal task_finished(id)
signal task_in_progress(probability)

onready var progress_bar:TextureProgress = $ProgressBar 

func _ready():
	sprite.texture = texture
	audio.stream = sound
	
func initialize(identifier: int, tareas: Array):
	id = identifier
	tasks = tareas
	
func _physics_process(delta):
	if task_activated && body_entered && !task_in_progress && !player.busy:
		player.busy = true
		audio.play()
		toggleAnimation(true)
		emit_signal("task_in_progress", probability)
		task_in_progress = true
		var sprite_position: Vector2 = sprite.position

		progress_bar.show()
			
func _on_GenericFurniture_body_entered(body):
	body_entered = true
	player = body

func _on_GenericFurniture_body_exited(body):
	if task_in_progress:
		player.busy = false
		task_in_progress = false
		audio.stop()
		toggleAnimation(false)
		task_activated = false
		progress_bar.hide()
	body_entered = false

func _on_GenericFurniture_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed) && !tasks.empty():
		task_activated = true

func _on_FurnitureTimer_timeout():
	if task_in_progress && progress_bar.value < 100:
		progress_bar.value += 10
	elif progress_bar.value == 100:
		audio.stop()
		task_activated = false
		task_in_progress = false
		body_entered = false
		progress_bar.value = 0
		progress_bar.hide()
		emit_signal("task_finished", id)
		if(taskFinishedSprite != null):
			taskFinishedSprite.visible = true
		toggleAnimation(false)
		tasks.remove(tasks.size() - 1)
	
func toggleAnimation(value: bool):
	if(animation != null):
		animation.visible = value


func _on_GenericFurniture_mouse_entered():
	if !tasks.empty():
		emit_signal("selected")
		material.set_shader_param("width", 8)

func _on_GenericFurniture_mouse_exited():
	material.set_shader_param("width", 0)
