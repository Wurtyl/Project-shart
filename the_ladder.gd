extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var ladder = $ladder

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	ladder.play()
	GlobalCanvasLayer.on_transition_finished.connect(load_game_scene)
	GlobalCanvasLayer.transition()

func load_game_scene():
	get_tree().change_scene_to_file("res://scenes/escaped.tscn")
