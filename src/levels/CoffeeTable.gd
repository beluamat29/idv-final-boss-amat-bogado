extends Node2D

onready var coffee:Sprite = $CoffeeArea/Coffee
onready var sparkles:Node2D = $Sparkles
onready var coffeeArea: Area2D = $CoffeeArea
onready var coffeeToDrink:bool = false
# Called when the node enters the scene tree for the first time.

signal drinking_coffee()

func showCoffe():
	coffee.visible = true
	sparkles.visible = true
	sparkles.playSparkles()
	coffeeToDrink = true


func _on_CoffeeArea_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed) && coffeeToDrink:
		emit_signal('drinking_coffee')


func _on_CoffeeArea_body_entered(body):
	if(coffeeToDrink):
		coffee.visible = false
		sparkles.visible = false
		coffeeToDrink = false
