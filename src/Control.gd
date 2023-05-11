extends CanvasLayer

onready var pause_menu: PopupMenu = $PopupPanel

func _ready():
	pass # Replace with function body.

#func _process(delta):
#	pass


func _on_MenuButton_pressed():
	pause_menu.show()
