extends Node2D

func _ready():
	pass

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/StartMenu.tscn")
