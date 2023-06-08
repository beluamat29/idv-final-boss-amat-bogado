extends CanvasLayer

onready var pause_menu: PopupMenu = $Menus/PausePopup
onready var victory_menu: PopupMenu = $Menus/VictoryPopup
onready var defeat_menu: PopupMenu = $Menus/DefeatPopup

signal restart_level
signal exit

func _on_MenuButton_pressed():
	get_tree().paused = true
	pause_menu.show()

func _un_pause():
	pause_menu.hide()
	defeat_menu.hide()
	victory_menu.hide()
	get_tree().paused = false

func _on_Resume_pressed():
	_un_pause()

func _on_Restart_pressed():
	_un_pause()
	emit_signal("restart_level")
	
func _on_player_win():
	get_tree().paused = true
	victory_menu.show()

func _on_player_lose():
	get_tree().paused = true
	defeat_menu.show()

func _on_Exit_pressed():
	_un_pause()
	emit_signal("exit")
	
func _on_Next_pressed():
	_un_pause()
	emit_signal("restart_level")
