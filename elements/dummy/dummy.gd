extends Node3D


@export var damage_indicator:PackedScene
@onready var damage_marker:Node3D = %DamageMarker

func take_damage(amount:float):
	var marker = damage_indicator.instantiate()
	marker.text = str(amount)
	damage_marker.add_child(marker)
