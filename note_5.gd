extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea

const lines: Array[String] = [
	"Holy crap",
	"This guys legs are completely mangled",
	"Let's see what his note says",
	"the note reads,",
	"I think I'm going to die here",
	"My legs are destrtroyed",
	"I fell down this damn hole chasing after Dereck",
	"He was running around all crazy with his axe",
	"Saying something about a mushroom creature",
	"This was supposed to be fun",
	"I researched this cave for weeks before we came down here",
	"Damn it all.",
	"(note ends)",
	"Well that explains the legs...",
	"*wink"
]

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	DialogueManager.start_dialogue(global_position, lines)
	await DialogueManager.dialogue_finished
