extends Node2D

@export var max_interaction_distance: float = 25.0
var current_target: Interactable = null
var query: PhysicsShapeQueryParameters2D
var shape: CircleShape2D


func _process(_delta: float) -> void:
	var new_target = get_interactable_under_cursor()
	if new_target != current_target:
		if current_target:
			current_target.unhighlight()
		current_target = new_target
		if current_target:
			current_target.highlight()
	
	if Input.is_action_just_pressed("Interact") and current_target:
		current_target.interact(get_parent())

func get_interactable_under_cursor() -> Interactable:
	var mouse_pos = get_global_mouse_position()
		
	if shape == null:
		shape = CircleShape2D.new()
		shape.radius = 1.0 # minimum detect radius

	if query == null:
		query = PhysicsShapeQueryParameters2D.new()
		query.collide_with_areas = true
		query.collide_with_bodies = true
		query.collision_mask = GlobalConst.cInteractionMask
		query.set_shape(shape)

	query.transform = Transform2D(0, mouse_pos)
	var results = get_world_2d().direct_space_state.intersect_shape(query, 1)
	if results.is_empty():
		return null
		
	var result_collider = results[0].collider
	if result_collider && (result_collider is Interactable) && result_collider.can_interact():
		if result_collider.global_position.distance_to(global_position) < max_interaction_distance:
			return result_collider
	return null
