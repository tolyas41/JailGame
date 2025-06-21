extends Node2D
class_name Interactable


func interact(user: Node2D) -> void:
	assert(false, "Method 'interact()' must be overridden")

func can_interact() -> bool:
	return true

func highlight() -> void:
	modulate = Color(Color.GREEN_YELLOW)

func unhighlight() -> void:
	modulate = Color(Color.WHITE)
