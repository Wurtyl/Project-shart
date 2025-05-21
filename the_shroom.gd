extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea

const lines: Array[String] = [
	"is that a...",
	"glowing mushroom??",
	"*YAAAAAAAAWN*",
	"man am I tired"
]

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	pass
