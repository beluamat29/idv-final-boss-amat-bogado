extends Node

var tiempoTotal = 300 #segundos
onready var pivotHours:Position2D = $PivotHours
onready var pivotMinutes:Position2D = $PivotMinutes
onready var music: AudioStreamPlayer = $Background
export var night_music: AudioStream

signal game_over
signal end_sunset

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _on_Countdown_timeout():
	if(tiempoTotal < 660):
		tiempoTotal += 1
		if(_minutes() == 0):
			pivotHours.rotation_degrees += 30
		pivotMinutes.rotation_degrees += 12
	
	else:
		get_tree().paused = true
		emit_signal("game_over")
		
	if _hour() == 18:
		music.stop()
		music.stream = night_music
		music.play()
		emit_signal("end_sunset")
		
func _hour():
	return tiempoTotal/30
	
func _minutes():
	return tiempoTotal%30	
