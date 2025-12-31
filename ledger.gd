@abstract
class_name Ledger
extends Node

@export var map: Node = null
@export var _units: Dictionary[Node, Variant] = {}
@export var _hovered_location: Variant = null
@export var _selected_location: Variant = null
@export var _hovered_unit: Node = null
@export var _selected_unit: Node = null


func add_unit(unit: Node, location: Variant) -> void:
	assert(not _units.has(unit), "The unit is already in the ledger.")
	map.add_child(unit)
	_place_unit(unit, location)
	_units[unit] = location


func hover_location(location: Variant) -> void:
	_hovered_location = location
	_move_cursor(location)
	# Consider using Dictionary inversion to optimize
	_hovered_unit = _units.find_key(location)


func select_location() -> void:
	_selected_location = _hovered_location
	# Consider using Dictionary inversion to optimize
	if _units.find_key(_selected_location) == _hovered_unit:
		_selected_unit = _hovered_unit


@abstract func _place_unit(unit: Node, location: Variant) -> void


@abstract func _move_cursor(location: Variant) -> void
