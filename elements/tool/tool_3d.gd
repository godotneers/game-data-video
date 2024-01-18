class_name Tool3D
extends MeleeWeapon3D

## Emitted when this tool harvests a quantity of an item.
signal harvested()

# Called when this weapon hits a body.
func on_hit(other:Node3D):
	if not _can_damage:
		return
		
	# handle any damage
	super.on_hit(other)
		
	if other.has_method("harvest"):
		var quantity = other.harvest()
		# only one damage per swing.
		_can_damage = false
		# and notify that we harvested something
		harvested.emit(quantity)
