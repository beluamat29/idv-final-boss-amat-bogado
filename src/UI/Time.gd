extends Node

var tiempoTotal = 300 #segundos
onready var pivotHours:Position2D = $PivotHours
onready var pivotMinutes:Position2D = $PivotMinutes

signal game_over
signal end_sunset

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _on_Countdown_timeout():
	if(tiempoTotal < 660):
		tiempoTotal += 5
		if(tiempoTotal%60 == 0):
			pivotHours.rotation_degrees += 30
		pivotMinutes.rotation_degrees += 30
	else:
		get_tree().paused = true
		emit_signal("game_over")
		
	if _hour() == 18:
		emit_signal("end_sunset")
		
func _hour():
	return tiempoTotal / 30
