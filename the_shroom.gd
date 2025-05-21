extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea

const lines: Array[String] = [
	"is that a...",
	"glowing mushroom??",
	"*YAAAAAAAAWN*",
	"man am I tired",
	"I wonder if this mushroom...",
	"has anyt..hing",
	"...to do wit..h that..."
]

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	DialogueManager.start_dialogue_alert_player(global_position, lines)
	interaction_area.queue_free()
	await DialogueManager.dialogue_complete
	print("dialog compelted")
	GlobalCanvasLayer.on_transition_finished.connect(load_game_scene)
	GlobalCanvasLayer.transition()

func load_game_scene():
	get_tree().change_scene_to_file("res://scenes/trippy.tscn")
