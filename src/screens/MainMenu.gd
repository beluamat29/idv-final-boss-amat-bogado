extends Node

export (PackedScene) var level_manager

func _on_StartButton_pressed():
	get_tree().change_scene_to(level_manager)


func _on_ExitButton_pressed():
	get_tree().quit()
