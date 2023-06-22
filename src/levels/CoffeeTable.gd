extends Node2D

onready var displayCoffee:Area2D = $Coffee
onready var sparkles = $Sparkles

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func displayCoffee():
	sparkles.displayAndPlayAnimation()
	displayCoffee.visible = true
	
func _on_Player_coffee_finished():
	hideCoffee()

func hideCoffee():
	sparkles.hideSparkles()
	displayCoffee.visible = false
