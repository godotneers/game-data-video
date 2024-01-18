class_name Item
extends Resource

## The name of the item.
@export var name:String

## The icon of the item.
@export var icon:Texture2D

## The scene containing the 3d representation of the item.
@export var scene:PackedScene

## Shoppe price
@export var price:int = 5

## Instantiates the 3d representation and initializes it with the 
## current item
func instantiate() -> Node3D:
	var result = scene.instantiate()
	if result.has_method("initialize"):
		result.initialize(self)
	return result
