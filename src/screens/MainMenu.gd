extends Node

export (PackedScene) var level_manager
export var cursor_inactive: Texture
export var cursor_click: Texture

var cursor_images: Array = []

func _ready():
	Input.set_custom_mouse_cursor(cursor_inactive, Input.CURSOR_ARROW, Vector2(25, 25))

func _physics_process(delta):
	if !cursor_images.empty():
			Input.set_custom_mouse_cursor(cursor_images.pop_front(), Input.CURSOR_ARROW, Vector2(25, 25))

func _on_StartButton_pressed():
	get_tree().change_scene_to(level_manager)


func _on_ExitButton_pressed():
	get_tree().quit()

func _on_selected():
	cursor_images.append(cursor_click)
	
func _on_unselected():
	cursor_images.append(cursor_inactive)
