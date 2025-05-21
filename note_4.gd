extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea

const lines: Array[String] = [
	"This one reeks",
	"Smells like he's been rotting for decades",
	"Looks like his notebook got covered in some kind of liquid before he died",
	"all but the last page is rotted",
	"the note reads,",
	"Oh my god I think Im gonna puke",
	"I found stevens body in some corner of the cave not too far from here",
	"The whole lower half of his face is completely gone.",
	"I found some of those mushrooms next to his body",
	"I tried to move them away to let him rest peacefully",
	"But I couldn't stand to stick around",
	"what am I gonna tell his girlfriend?",
	"God why us this happening",
	"(note ends)",
	"dang, I think I know what that liquid was",
	"sucker puked on himself before he died",
	"gross.."
]

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	DialogueManager.start_dialogue(global_position, lines)
	await DialogueManager.dialogue_finished
