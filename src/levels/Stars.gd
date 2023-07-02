extends Node

onready var star1:AnimationPlayer = $Stars1/AnimationPlayer
onready var star2:AnimationPlayer = $Stars2/AnimationPlayer

func animateStars():
	star1.play("shine")
	star2.play("shine")
