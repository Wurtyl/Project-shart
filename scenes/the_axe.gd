extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var pickup = $Pickup

const lines: Array[String] = [
	"Holy S#it!",
	"This guy's got an axe in his head!",
	".......",
	"Don't mind if I do..",
]

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	pickup.play()


func _on_pickup_finished():
	DialogueManager.start_dialogue(global_position, lines)
	await DialogueManager.dialogue_finished
	queue_free()
