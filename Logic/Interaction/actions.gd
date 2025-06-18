extends Node

#Action names
var actions = {
	GlobalConst.cAction_PushUps: func(): _action_push_ups(_action_object),
}

#TODO: как передать в call() параметр?
var _action_object: Node2D

var _current_action: StringName
var _in_action: bool = false

func DoAction(ActionName: StringName, ActionObject: Node2D):
	_action_object = ActionObject
	if (ActionName in actions):
		actions[ActionName].call()
		_in_action = true
	else:
		push_error("actions.gd DoAction() Unknown ActionName")

func IsInAction() -> bool:
	return _in_action

func InterruptAction() -> void:
	_in_action = false
	_current_action = StringName()
	
func _action_push_ups(ActionObject: Node2D) ->void:
	get_parent().global_position = ActionObject.global_position
	get_node("../Player").PlayAnimation(GlobalConst.cAction_PushUps)
	print("_action_push_ups" + ActionObject.to_string())
