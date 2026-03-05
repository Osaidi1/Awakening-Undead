extends Node3D

@onready var world: Node3D = $"../.."
@onready var point: Marker3D = $point
const ZOMBIE = preload("res://scenes/zombie.tscn")
@onready var player: Player = %Player
const P_90 = preload("res://weapon_resource/p90.tres")
var can_spawn := true

func spawn_zombie():
	if can_spawn:
		var pos = point.global_position
		var instance = ZOMBIE.instantiate()
		pos.y += 2
		world.add_child(instance)
		instance.global_position = pos
		pos.x += 5
		if instance.is_alive:
			can_spawn = false
		else:
			can_spawn = true
			pos.x -= 5
		
