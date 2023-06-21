extends Node2D

onready var sparkle1: AnimationPlayer = $Sparkle1/AnimationPlayer
onready var sparkle2: AnimationPlayer = $Sparkle2/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func playSparkles():
	sparkle1.play("bright")
	yield(get_tree().create_timer(0.5), "timeout")
	sparkle2.play("bright")
