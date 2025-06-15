extends CollisionObject2D

signal interact_on_mouse_enter
signal interact_on_mouse_leave
signal on_interact
#@export var : AnimatedSprite2D
@export var InteractDistance: float = 30

var isInteractPossible: bool = false

func _mouse_enter() -> void:
	var PlayerPosition: Vector2 = get_viewport().get_camera_2d().get_parent().get_global_position()
	var DistanceToPlayer = get_global_position().distance_to(PlayerPosition)
	if (DistanceToPlayer < InteractDistance):
		SetInteractPossible(true)
	else:
		SetInteractPossible(false)

func _mouse_exit() -> void:
	SetInteractPossible(false)

func SetInteractPossible(Possible: bool):
	if (Possible == isInteractPossible):
		return
	
	isInteractPossible = Possible
	if (isInteractPossible):
		interact_on_mouse_enter.emit()
	else:
		interact_on_mouse_leave.emit()

func _unhandled_input(event: InputEvent) -> void:
	if (!isInteractPossible):
		return
	if (event.is_action("Interact")):
		on_interact.emit()
	
