extends VBoxContainer

const listItemScene = preload("UI/ListItem.tscn")
onready var tasksList:Array = []


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
	itemAtIndex[1].markAsCompleted()