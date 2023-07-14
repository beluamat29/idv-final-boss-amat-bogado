extends Node

export (PackedScene) var level: PackedScene

onready var current_level_container: Node = $CurrentLevelContainer
onready var ui: CanvasLayer = $UI


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
	
	level_instance.connect("victory", self, "_on_player_win")
	level_instance.connect("game_over", self, "_on_player_lose")
	
func _on_player_win():
	ui._on_player_win()
	
func _on_player_lose(text):
	ui._on_player_lose(text)

func _on_UI_exit():
	get_tree().change_scene("res://src/screens/MainMenu.tscn")


func _on_UI_restart_level():
	_setup_level()
