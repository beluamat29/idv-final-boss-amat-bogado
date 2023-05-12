extends Node

onready var current_level_container: Node = $CurrentLevelContainer
export (PackedScene) var level: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	_setup_level()
	

func _setup_level():
	var level_instance = level.instance()
	if current_level_container.get_child_count() > 0:
		for child in current_level_container.get_children():
				current_level_container.remove_child(child)
				child.queue_free()
	current_level_container.add_child(level_instance)
	

func _on_Canvas_restart_level():
	_setup_level()
