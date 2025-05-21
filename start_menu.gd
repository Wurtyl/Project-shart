extends Control

@onready var boom = $BOOM
@onready var clik = $Clik

func _on_start_pressed():
	boom.play()
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_options_pressed():
	clik.play()


func _on_exit_pressed():
	get_tree().quit()
