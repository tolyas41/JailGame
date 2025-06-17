extends Node2D


#func _init() -> void:


func _on_interact(user: Node2D) -> void:
	user.get_node("Actions").DoAction(GlobalConst.cAction_PushUps, self)
