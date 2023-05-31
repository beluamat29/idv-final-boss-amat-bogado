extends Node2D

onready var crying = false
onready var attention = $Attention
onready var timer = $ChildTimer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _on_ChildTimer_timeout():
	attention.visible = true
