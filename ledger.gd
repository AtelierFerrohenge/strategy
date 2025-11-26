@abstract
class_name Ledger
extends Node

@export var map: Node = null
@export var _units: Dictionary[Node, Variant] = {}


func add_unit(unit: Node, location: Variant):
	assert(not _units.has(unit), "The unit is already in the ledger.")
	map.add_child(unit)
	_place_unit(unit, location)
	_units[unit] = location


@abstract func _place_unit(unit: Node, location: Variant)
