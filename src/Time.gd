extends Node

var tiempoTotal = 300 #segundos
onready var label:Label = $TimeLeft

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_label(tiempo):
	label.text = String(tiempo/60) + ":" + String(tiempo%60)
	
func _on_Countdown_timeout():
	if(tiempoTotal > 0):
		tiempoTotal -= 1
		update_label(tiempoTotal)
	else:
		print('juego terminado')	
	
