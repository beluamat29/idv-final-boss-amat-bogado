extends Node2D

onready var coffee:Sprite = $CoffeeArea/Coffee
onready var sparkles:Node2D = $Sparkles

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func showCoffe():
	coffee.visible = true
	sparkles.visible = true
	sparkles.playSparkles()
	
