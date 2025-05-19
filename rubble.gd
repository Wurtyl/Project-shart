extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var manager = %GameManager
@onready var broken = $Broken

const lines: Array[String] = [
	"nice."
]

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if manager.score >= 1:
		broken.play()
		await _on_broken_finished()
		DialogueManager.start_dialogue(global_position, lines)
		await DialogueManager.dialogue_finished
		queue_free()
	else: 
		pass


func _on_broken_finished():
	pass
