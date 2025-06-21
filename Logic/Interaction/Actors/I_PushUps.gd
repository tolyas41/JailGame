extends Interactable


func interact(user: Node2D) -> void:
	var Actions = user.get_node("Actions")
	if (Actions):
		Actions.DoAction(GlobalConst.cAction_PushUps, self)
