extends Node

onready var tasksList = $TaskList/ItemsList
onready var tasks = $TaskList
onready var stress_bar: Control = $StressBar
onready var furniture: Node2D = $Environment/Entities/Furniture
onready var player: KinematicBody2D = $Environment/Entities/Player
onready var coffeeTable = $Environment/Entities/CoffeeTable
var SHOW_COFFE_VALUE = 40
var hasDisplayedCoffee = false
signal victory
signal game_over(text)
signal task_finished
var cursor_images: Array = []
export var cursor_point: Texture
export var cursor_inactive: Texture

func _physics_process(delta):
	if !cursor_images.empty():
		Input.set_custom_mouse_cursor(cursor_images.pop_back(), Input.CURSOR_ARROW, Vector2(25,25))

func objectWasPressed(objectId):
	tasksList.objectWasPressed(objectId)
	
func _on_ItemsList_victory():
	emit_signal("victory")

func _on_Time_game_over():
	emit_signal("game_over", "Te quedaste sin tiempo")

func _on_StressBar_game_over():
	emit_signal("game_over", "Perdiste la cordura")
		
func _on_GenericFurniture_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		player.set_target()

func _on_GenericFurniture_task_finished(id):
	objectWasPressed(id)
	stress_bar._change_stress_bar(-10)
	player.busy = false
	emit_signal("task_finished")
	
func _on_StressBar_change_stress_signs(value: int):
	player.change_stress_signs(value)
	if(value >= SHOW_COFFE_VALUE && !hasDisplayedCoffee):
		coffeeTable.displayCoffee()
		player.coffeIsAvailable()
		hasDisplayedCoffee = true
	

func _on_Child_set_player_target():
	player.set_target()
	
func _on_Child_crying():
	stress_bar.increased_stress = 4
	
func _on_Child_player_baby_toggle(value):
	stress_bar.increased_stress = 1

func _on_Fridge_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		player.set_target()

func _on_Fridge_body_entered(body):
	tasks.show()
	player.busy = true

func _on_Fridge_body_exited(body):
	tasks.hide()
	player.busy = false


func _on_Fridge_mouse_entered():
	_set_point_mouse_cursor()

func _on_mouse_exited():
	cursor_images.append(cursor_inactive)

func _on_Floor_mouse_entered():
	_set_point_mouse_cursor()

func _on_furniture_selected():
	_set_point_mouse_cursor()
	
func _set_point_mouse_cursor():
	cursor_images.append(cursor_point)
