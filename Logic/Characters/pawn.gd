class_name Pawn
extends Node

@export var Speed: float = 80

@onready var CharacterBody = get_parent()
@onready var CharacterSprite = get_node("../CharacterSprite")
@onready var Actions = get_node("../Actions")

func _ready() -> void:
	PlayAnimation("Idle")

func Move(MoveVelocity: Vector2):
	CharacterBody.velocity = MoveVelocity
	CharacterBody.move_and_slide()
	
func PlayAnimation(AnimName: String):
	CharacterSprite.play(AnimName)
