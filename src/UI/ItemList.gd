extends VBoxContainer

const listItemScene = preload("ListItem.tscn")

onready var tasksList:Dictionary = {}

signal victory

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func add_task(taskId, taskName):
	var item = listItemScene.instance()
	item.addText(taskName)
	item.setId(taskId)
	tasksList[taskId] = ([item, false])
	self.add_child(item)
	
func objectWasPressed(objectId):
	var itemAtIndex = tasksList[objectId]
	itemAtIndex[1] = true
	itemAtIndex[0].markAsCompleted()
	
	checkIfWin()
	
func checkIfWin():
	var win = true
	
	for task in tasksList.values():
		win = win && task[1]
	
	if win:
		emit_signal("victory")
	
