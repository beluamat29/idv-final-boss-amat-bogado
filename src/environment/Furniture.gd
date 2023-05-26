extends Node2D

class_name Furniture
export (PackedScene) var genericFurnitureScene: PackedScene

func get_tasks():
	var tasks: Dictionary = {}
	var furnitures = get_children()
	for furniture in furnitures:
		tasks[furniture.id] = furniture.tasks
	return tasks

func _ready():
	var tasksList = ['Asistir a reunion laboral', 'Preparar almuerzo', 'Regar planta', 'Lavar ropa sucia']
	var furnitureInstances = get_children();
	print(furnitureInstances)
	for i in range(furnitureInstances.size()):
		furnitureInstances[i].id = i
		furnitureInstances[i].tasks = [tasksList[i]]
		
	
func instanciate_furniture(id: int, tasks: Array):
	var instancedFurniture = genericFurnitureScene.instance()
	instancedFurniture.initialize(id, tasks)
	self.add_child(instancedFurniture)
	
