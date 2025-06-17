extends Pawn

#comment from nadya test
func _on_interact(user) -> void:
	get_node("../TESTAudio").play()
