extends Pawn

func _ready() -> void:
	$CharacterBody/Camera2D.make_current()
	GameState.register_player(self)
	
func _process(delta) -> void:
	ProcessInput()

#INPUT
func ProcessInput():
	var MoveDirection = Vector2()
	var MoveAnimName = "Idle"
	if Input.is_action_pressed(GlobalConst.cMoveUp):
		MoveDirection += Vector2(0, -Speed)
		MoveAnimName = GlobalConst.cMoveUp
	if Input.is_action_pressed(GlobalConst.cMoveDown):
		MoveDirection += Vector2(0, Speed)
		MoveAnimName = GlobalConst.cMoveDown
	if Input.is_action_pressed(GlobalConst.cMoveLeft):
		MoveDirection += Vector2(-Speed, 0)
		MoveAnimName = GlobalConst.cMoveLeft
		$CharacterBody/CharacterSprite.flip_h = true
	if Input.is_action_pressed(GlobalConst.cMoveRight):
		MoveDirection += Vector2(Speed, 0)
		MoveAnimName = GlobalConst.cMoveRight
		$CharacterBody/CharacterSprite.flip_h = false

	Move(MoveDirection)
	PlayAnimation(MoveAnimName)
