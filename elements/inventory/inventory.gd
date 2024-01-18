class_name Inventory
extends Resource

@export var _content:Array[Item] = []

## Add an item to this inventory.
func add_item(to_add:Item):
	_content.append(to_add)
	
## Remove an item from this inventory.	
func remove_item(to_remove:Item):
	_content.erase(to_remove)
	
## Returns all items in this inventory.	
func get_items() -> Array[Item]:
	return _content

func has_all(items:Array[Item]) -> bool:
	var needed:Array[Item] = items.duplicate()
	for available in _content:
		needed.erase(available)
		
	return needed.is_empty()
