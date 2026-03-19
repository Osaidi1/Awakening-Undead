extends Node3D

var jump := false

@onready var up: RayCast3D = $Up
@onready var down: RayCast3D = $Down

func _process(delta: float) -> void:
	if !up.is_colliding() and down.is_colliding():
		#jump = true
		pass
