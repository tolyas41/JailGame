class_name Pawn
extends Node2D

@export var Speed: float = 80

func _ready() -> void:
	PlayAnimation("Idle")

func Move(MoveVelocity: Vector2):
	$CharacterBody.velocity = MoveVelocity
	$CharacterBody.move_and_slide()
	
func PlayAnimation(AnimName: String):
	$CharacterBody/CharacterSprite.play(AnimName)
