extends Node

var tiempoTotal = 300 #segundos
var TIME_ABOUT_TO_FINISH_HOUR = 22
onready var pivotHours:Position2D = $PivotHours
onready var pivotMinutes:Position2D = $PivotMinutes
onready var music: AudioStreamPlayer = $Background
export var night_music: AudioStream

signal game_over
signal end_sunset
signal time_about_to_finish
	
func checkIfTimeAboutToFinish():
	if _hour() == TIME_ABOUT_TO_FINISH_HOUR:
		emit_signal("time_about_to_finish")
		music.timeAboutToFinish()
		
func _on_Countdown_timeout():
	if(tiempoTotal < 720):
		tiempoTotal += 1
		if(_minutes() == 0):
			pivotHours.rotation_degrees += 30
		pivotMinutes.rotation_degrees += 12
	
	else:
		get_tree().paused = true
		emit_signal("game_over")
		
	checkIfTimeAboutToFinish()	
	if _hour() == 18:
		music.stop()
		music.stream = night_music
		music.play()
		emit_signal("end_sunset")
		
func _hour():
	return tiempoTotal/30
	
func _minutes():
	return tiempoTotal%30	
