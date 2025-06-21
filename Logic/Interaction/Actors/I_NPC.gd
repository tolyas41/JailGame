extends Interactable

@export var Dialog: DialogicTimeline

func interact(user: Node2D) -> void:
	$TESTAudio.play()
	#TODO open dialog
	Dialogic.start(Dialog)

func can_interact() -> bool:
	return Dialog != null
