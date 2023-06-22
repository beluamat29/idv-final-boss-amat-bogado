extends Node2D

onready var sparkles1Animation: AnimationPlayer = $Sparkles1/AnimationPlayer
onready var sparkles2Animation: AnimationPlayer = $Sparkles2/AnimationPlayer

func displayAndPlayAnimation():
	sparkles1Animation.play("bright")
	yield(get_tree().create_timer(0.2), "timeout")
	sparkles2Animation.play("bright")
	self.visible = true

func hideSparkles():
	self.visible = false
