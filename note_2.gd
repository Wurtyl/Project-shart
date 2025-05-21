extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea

const lines: Array[String] = [
	"oh man",
	"this one's got mushrooms growing out of his corpse.",
	"looks like whatever he once called a notebook is now mushroom food.",
	"can only really make out a few words from one of the pages...",
	" DON'T... MUSHROOM... GAS...",
	"wonder what he was trying to say."
]

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	DialogueManager.start_dialogue(global_position, lines)
	await DialogueManager.dialogue_finished
