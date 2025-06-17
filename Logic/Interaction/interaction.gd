extends CollisionObject2D

signal interact_on_mouse_enter
signal interact_on_mouse_leave
signal on_interact(user: Node2D)

@export var InteractDistance: float = 30

var _IsInteractPossible: bool = false

func _mouse_enter() -> void:
	if (_is_player_close_to_interact()):
		_set_interact_possible(true)
	else:
		_set_interact_possible(false)

func _mouse_exit() -> void:
	_set_interact_possible(false)

func _is_player_close_to_interact() -> bool:
	var PlayerPosition: Vector2 = GameState.current_player.get_global_position()
	var DistanceToPlayer = get_global_position().distance_to(PlayerPosition)
	return DistanceToPlayer < InteractDistance
	

func _set_interact_possible(Possible: bool):
	if (Possible == _IsInteractPossible):
		return
	
	_IsInteractPossible = Possible
	if (_IsInteractPossible):
		interact_on_mouse_enter.emit()
	else:
		interact_on_mouse_leave.emit()

func _unhandled_input(event: InputEvent) -> void:
	if (!_IsInteractPossible):
		return
	if (event.is_action_pressed("Interact")):
		on_interact.emit(GameState.current_player)
	
