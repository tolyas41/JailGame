extends Node

#Action names
var actions = {
	GlobalConst.cAction_PushUps: func(): _action_push_ups(_action_object),
}

var _action_object: Node2D

func DoAction(ActionName: StringName, ActionObject: Node2D):
	_action_object = ActionObject
	if (ActionName in actions):
		actions[ActionName].call()
	else:
		push_error("actions.gd DoAction() Unknown ActionName")

func _action_push_ups(ActionObject: Node2D) ->void:
	print("_action_push_ups" + ActionObject.to_string())
