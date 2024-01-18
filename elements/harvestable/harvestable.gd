extends Node3D


@export var harvested:Item
@export var damage_indicator:PackedScene

@onready var _damage_indicator_position:Node3D = %DamageIndicatorPosition

func harvest() -> Item:
	return harvested
