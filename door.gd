extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var manager = %GameManager
@onready var locked = $Locked
@onready var unlocked = $Unlocked

const lines: Array[String] = [
	"got it."
]

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if manager.score >= 2:
		unlocked.play()
		await _on_unlocked_finished()
		DialogueManager.start_dialogue(global_position, lines)
		await DialogueManager.dialogue_finished
		queue_free()
	else: 
		locked.play()


func _on_unlocked_finished():
	pass
