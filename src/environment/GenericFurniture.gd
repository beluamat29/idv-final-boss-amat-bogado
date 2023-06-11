extends Area2D

export var id: int = 1
onready var sprite: Sprite = $Sprite
onready var taskFinishedSprite = $TaskFinishedSprite
onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D
export var texture: Texture
var task_activated: bool = false
var task_in_progress: bool = false
var body_entered: bool = false
export var tasks: Array = []
export var probability: int = 10
export var sound: AudioStream

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
	if task_activated && body_entered && !task_in_progress:
		audio.play()
		emit_signal("task_in_progress", probability)
		task_in_progress = true
		var sprite_position: Vector2 = sprite.position

		progress_bar.show()
		var progress_bar_position = Vector2(sprite_position.x, sprite_position.y - 300)
		progress_bar.set_position(progress_bar_position)

func _on_GenericFurniture_body_entered(body):
	body_entered = true

func _on_GenericFurniture_body_exited(body):
	audio.stop()
	task_activated = false
	task_in_progress = false
	body_entered = false
	progress_bar.hide()

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
		tasks.remove(tasks.size() - 1)
	
