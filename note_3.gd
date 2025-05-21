extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea

const lines: Array[String] = [
	"Jesus Christ!!",
	"This guys whole jaw is missing!",
	"there's a partially singed note next to him.",
	"it reads,",
	"I haven't seen anyone in what feels like days",
	"I'm so hungry I can barely even get up from this corner I've found myself in",
	"I can only imagine what those mushrooms taste like...",
	"just one bite couldn't hurt, right?",
	"what's the worst that could hap...",
	"(the rest of the note seems to be melted off)",
	"Can only imagine how that happened."
]

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	DialogueManager.start_dialogue(global_position, lines)
	await DialogueManager.dialogue_finished
