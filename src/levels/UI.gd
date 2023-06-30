extends CanvasLayer

onready var pause_menu: PopupMenu = $Menus/PausePopup
onready var victory_menu: PopupMenu = $Menus/VictoryPopup
onready var defeat_menu: PopupMenu = $Menus/DefeatPopup
export var cursor_inactive: Texture
export var cursor_click: Texture

var cursor_images: Array = []
signal restart_level
signal exit

func _ready():
	Input.set_custom_mouse_cursor(cursor_inactive, Input.CURSOR_ARROW, Vector2(25, 25))

func _physics_process(delta):
	if !cursor_images.empty():
			Input.set_custom_mouse_cursor(cursor_images.pop_front(), Input.CURSOR_ARROW, Vector2(25, 25))
	
	
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
	
func _on_selected():
	cursor_images.append(cursor_click)
	
func _on_unselected():
	cursor_images.append(cursor_inactive)
