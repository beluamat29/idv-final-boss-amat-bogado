extends Node2D

onready var crying = false
onready var attention = $Attention
onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D

var task_activated: bool = false
var body_entered: bool = false
var crying_probability: int = 0

signal set_player_target()
signal player_baby_toggle(value)
signal crying()
signal selected()

func _physics_process(delta):
	if task_activated && body_entered && crying:
		crying = false
		attention.visible = false
		task_activated = false
		audio.stop()
		emit_signal("player_baby_toggle", true)
		$StrollerAnimation.play("swing", -1, 1)
	
func _on_ChildTimer_timeout():
	var randomNumberGenerator = RandomNumberGenerator.new()
	randomNumberGenerator.randomize()
	if randomNumberGenerator.randf_range(1, 100) <= crying_probability:
		audio.play()
		attention.visible = true
		crying = true
		emit_signal("crying")
		

func _on_Stroller_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed) && crying:
		task_activated = true
		emit_signal("set_player_target")

func _on_Stroller_body_entered(body):
	body_entered = true
	
func _on_Stroller_body_exited(body):
	body_entered = false

func _on_StrollerAnimation_animation_finished(anim_name):
	emit_signal("player_baby_toggle", false)
	
func _on_task_in_progress(probability):
	crying_probability = probability


func _on_task_finished(id):
	crying_probability = 0


func _on_furniture_body_exited(body):
	if !body.busy:
		crying_probability = 0


func _on_Child_body_exited(body):
	body_entered = false


func _on_Child_body_entered(body):
	body_entered = true


func _on_Child_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed) && crying:
		task_activated = true
		emit_signal("set_player_target")


func _on_Child_mouse_entered():
	if crying:
		emit_signal("selected")
		material.set_shader_param("width", 8)


func _on_Child_mouse_exited():
	material.set_shader_param("width", 0)
