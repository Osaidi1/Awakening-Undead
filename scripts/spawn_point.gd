extends Node3D

@onready var world: Node3D = $"../.."
@onready var point: Marker3D = $point
@onready var player: Player = %Player

const ZOMBIE := preload("res://scenes/zombie.tscn")
const P_90 := preload("res://weapon_resource/p90.tres")

var can_spawn := true

var instance
var second_instance

func spawn_zombie() -> void:
	var pos = point.global_position
	instance = ZOMBIE.instantiate()
	pos.y += 2
	world.add_child(instance)
	instance.global_position = pos
	if instance.is_alive:
		can_spawn = false
	else:
		if second_instance:
			can_spawn = false
		else:
			can_spawn = true

func spawn_second_zombie() -> void:
	var pos = point.global_position
	second_instance = ZOMBIE.instantiate()
	pos.y += 2
	world.add_child(second_instance)
	second_instance.global_position = pos
	second_instance.global_position.x += 1
	second_instance.global_position.z += 1
	if second_instance.is_alive:
		can_spawn = false
	else:
		if instance:
			can_spawn = false
		else:
			can_spawn = true
