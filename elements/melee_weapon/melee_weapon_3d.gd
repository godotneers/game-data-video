class_name MeleeWeapon3D
extends Node3D

# Whether this weapon can currently cause damage.
var _can_damage:bool = false
# Whether this weapon is currently swinging.
var _is_swinging:bool = false

var _descriptor:MeleeWeapon


func initialize(descriptor:MeleeWeapon):
	_descriptor = descriptor

# Enables damage for the weapon during the given timeframe.
func swing(time:float):
	if _is_swinging:
		return
		
	_can_damage = true
	_is_swinging = true
	await get_tree().create_timer(time).timeout
	
	_can_damage = false
	_is_swinging = false

# Called when this weapon hits a body.
func on_hit(other:Node3D):
	if not _can_damage:
		return
		
	if other.has_method("take_damage"):
		other.take_damage(_descriptor.damage)
		# only one damage per swing.
		_can_damage = false
