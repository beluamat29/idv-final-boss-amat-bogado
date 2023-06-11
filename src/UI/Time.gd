extends Node

var tiempoTotal = 300 #segundos
onready var label:Label = $TimeLeft

signal game_over

# Called when the node enters the scene tree for the first time.
func _ready():
	update_label(tiempoTotal)

func update_label(tiempo):
	var hours = tiempo/60 * 2
	var minutes = tiempo%60
	label.text = _hours(hours) + ":" + _minutes(minutes)
	
func _minutes(minutes):
	if minutes == 0:
		return '00'
	if minutes <= 9:
		return '0' + String(minutes)
	return String(minutes)
	
func _hours(hours):
	if hours == 0:
		return '00'
	if hours <= 9:
		return '0' + String(hours)
	return String(hours)
	
func _on_Countdown_timeout():
	if(tiempoTotal < 660):
		tiempoTotal += 5
		update_label(tiempoTotal)
	else:
		get_tree().paused = true
		emit_signal("game_over")
		
