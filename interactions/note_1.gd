extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea

const lines: Array[String] = [
	"poor guy.",
	"probably been dead for a while.",
	"looks like there's some kind of note buried in his bones,",
	"it reads...",
	"That damn mushroom is keeping us here.",
	"Almost as if it's toying with us.",
	"Some kind of doors seem to have sprouted in front of every exit.",
	"Not even james can pick the locks",
	"We're going to DIE here.",
	"I wish I could see my wife... (note ends)",
	"Yeesh, hope I don't meet the same fate as THAT guy."
]

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	DialogueManager.start_dialogue(global_position, lines)
	await DialogueManager.dialogue_finished
