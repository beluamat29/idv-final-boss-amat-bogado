extends VBoxContainer

const listItemScene = preload("ListItem.tscn")
onready var tasksList:Array = []

signal victory

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func add_task(taskId, taskName):
	var item = listItemScene.instance()
	item.addText(taskName)
	item.setId(taskId)
	tasksList.append([taskId, item, false])
	self.add_child(item)
	
func objectWasPressed(objectId):
	var itemAtIndex = tasksList[objectId]
	itemAtIndex[2] = true
	itemAtIndex[1].markAsCompleted()
	
	checkIfWin()
	
func checkIfWin():
	var win = true
	
	for task in tasksList:
		win = win && task[2]
	
	if win:
		emit_signal("victory")
	