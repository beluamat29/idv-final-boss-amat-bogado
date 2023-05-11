extends CanvasLayer

onready var pause_menu: PopupMenu = $PopupPanel

signal restart_level

func _ready():
	pass # Replace with function body.

#func _process(delta):
#	pass


func _on_MenuButton_pressed():
	get_tree().paused = true
	pause_menu.show()

func _un_pause():
	pause_menu.hide()
	get_tree().paused = false

func _on_Resume_pressed():
	_un_pause()


func _on_Restart_pressed():
	_un_pause()
	emit_signal("restart_level")
