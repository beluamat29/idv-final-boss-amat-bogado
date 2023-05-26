extends Area2D

var id: int = 12
var task_activated: bool = false
var task_in_progress: bool = false
var tasks: Array = ["Asistir a la reunion de las 10:00 am"]

signal task_finished(id)

onready var progress_bar:TextureProgress = $ProgressBar 

func initialize(id: int, tareas: Array):
	id = id
	tasks = tareas

func _on_Countdown_timeout():
	if task_in_progress && progress_bar.value < 100:
		progress_bar.value += 10
	elif progress_bar.value == 100:
		task_activated = false
		task_in_progress = false
		progress_bar.value = 0
		progress_bar.hide()
		emit_signal("task_finished", id)
		tasks.remove(tasks.size() - 1)


func _on_GenericFurniture_body_entered():
	if task_activated:
		task_in_progress = true
		progress_bar.show()


func _on_GenericFurniture_body_exited():
	task_activated = false
	task_in_progress = false
	progress_bar.hide()


func _on_GenericFurniture_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed) && !tasks.empty():
		task_activated = true
