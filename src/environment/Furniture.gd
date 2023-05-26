extends Node2D

class_name Furniture
export (PackedScene) var genericFurnitureScene: PackedScene


func get_tasks():
	var tasks: Dictionary = {}
	var furnitures = get_children()
	for furniture in furnitures:
		tasks[furniture.id] = furniture.tasks
	print('/////////')
	print(tasks)
	return tasks

func _ready():
	instanciate_furniture(1, ['Preparar almuerzo']);
	instanciate_furniture(2, ['Lavar ropa sucia']);
	instanciate_furniture(3, ['Regar la planta']);
	instanciate_furniture(4, ['lkanflkanklanfkla']);
	
func instanciate_furniture(id: int, tasks: Array):
	var instancedFurniture = genericFurnitureScene.instance()
	instancedFurniture.initialize(id, tasks)
	self.add_child(instancedFurniture)
	
