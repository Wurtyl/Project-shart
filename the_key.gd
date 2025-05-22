extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var key = $key

const lines: Array[String] = [
	"This ones completely enthralled in mushrooms",
	"One of them even looks like a key...",
	"maybe I could use it."
]

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	DialogueManager.start_dialogue(global_position, lines)
	await DialogueManager.dialogue_complete
	key.play()
