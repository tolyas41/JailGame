extends Pawn

@onready var Camera: Camera2D = get_node("../Camera2D")

func _ready() -> void:
	Camera.make_current()
	GameState.register_player(get_parent())
	
func _process(delta) -> void:
	_process_input()

#INPUT
func _process_input():
	_process_movement()

func _process_movement():
	var MoveDirection = Vector2()
	var MoveAnimName
	
	if Input.is_action_pressed(GlobalConst.cMoveUp):
		MoveDirection += Vector2(0, -Speed)
		MoveAnimName = GlobalConst.cMoveUp
	if Input.is_action_pressed(GlobalConst.cMoveDown):
		MoveDirection += Vector2(0, Speed)
		MoveAnimName = GlobalConst.cMoveDown
	if Input.is_action_pressed(GlobalConst.cMoveLeft):
		MoveDirection += Vector2(-Speed, 0)
		MoveAnimName = GlobalConst.cMoveLeft
		CharacterSprite.flip_h = true
	if Input.is_action_pressed(GlobalConst.cMoveRight):
		MoveDirection += Vector2(Speed, 0)
		MoveAnimName = GlobalConst.cMoveRight
		CharacterSprite.flip_h = false
	
	if (!MoveDirection.is_zero_approx()):
		Actions.InterruptAction()
		Move(MoveDirection)
		PlayAnimation(MoveAnimName)

	if (MoveDirection.is_zero_approx() && !Actions.IsInAction()):
		PlayAnimation("Idle")
