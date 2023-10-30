extends Node2D

const prefab = preload("res://area_2d.tscn")

@export var target_position:Vector2

func _ready():
	var target
	var a
	var cast
	
	# Test one
	target = prefab.instantiate()
	add_child(target)
	target.position = target_position
	
	a = prefab.instantiate()
	add_child(a)
	a.position = target.position
	cast = ShapeCast2D.new()
	cast.collision_mask = target.collision_mask
	cast.max_results = 1
	cast.exclude_parent = true
	cast.collide_with_areas = true
	cast.collide_with_bodies = true
	cast.shape = a.get_node("CollisionShape2D").shape
	cast.target_position = Vector2.ZERO
	a.add_child(cast)
	cast.force_shapecast_update()
	print("Add before position colliding? ", cast.is_colliding())
	
	remove_child(a)
	remove_child(target)
	
	# Test two
	target = prefab.instantiate()
	target.position = target_position
	add_child(target)
	
	a = prefab.instantiate()
	a.position = target.position
	add_child(a)
	cast = ShapeCast2D.new()
	cast.collision_mask = target.collision_mask
	cast.max_results = 1
	cast.exclude_parent = true
	cast.collide_with_areas = true
	cast.collide_with_bodies = true
	cast.shape = a.get_node("CollisionShape2D").shape
	cast.target_position = Vector2.ZERO
	a.add_child(cast)
	cast.force_shapecast_update()
	print("Position before add colliding? ", cast.is_colliding())
	remove_child(a)

