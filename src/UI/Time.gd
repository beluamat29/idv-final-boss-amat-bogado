extends Node

var tiempoTotal = 300 #segundos
onready var label:Label = $TimeLeft

signal game_over

# Called when the node enters the scene tree for the first time.
func _ready():
	update_label(tiempoTotal)

func update_label(tiempo):
	label.text = String(tiempo/60) + ":" + String(tiempo%60)
	
func _on_Countdown_timeout():
	if(tiempoTotal > 0):
		tiempoTotal -= 1
		update_label(tiempoTotal)
	else:
		get_tree().paused = true
		emit_signal("game_over")
		
