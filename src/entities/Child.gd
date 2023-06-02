extends Node2D

onready var crying = false
onready var attention = $Attention
onready var cryingTimer = $ChildCryingCountdown
onready var randomTimer = $ChildRandomTimer

var task_activated: bool = false
var body_entered: bool = false

signal game_finished()
signal set_player_target()
signal player_baby_toggle(value)
# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if task_activated && body_entered && crying:
		crying = false
		attention.visible = false
		task_activated = false
		cryingTimer.stop()
		randomTimer.stop()
		emit_signal("player_baby_toggle", true)
		$StrollerAnimation.play("swing", -1, 1)
	
func _on_ChildTimer_timeout():
	attention.visible = true
	crying = true
	cryingTimer.start()

func _on_ChildCryingCountdown_timeout():
	emit_signal("game_finished")

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
	randomTimer.reset()
	
