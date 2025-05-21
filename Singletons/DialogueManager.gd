extends Node

@onready var text_box_scene = preload("res://scenes/textbox.tscn")

var dialogue_lines: Array[String] = []
var current_line_index = 0

var text_box
var text_box_position: Vector2

var is_dialogue_active = false
var can_advance_line = false
var alert_player = false
signal dialogue_complete

func start_dialogue_alert_player(position: Vector2, lines: Array[String]):
	start_dialogue(position, lines)
	alert_player = true
	
func start_dialogue(position: Vector2, lines: Array[String]):
	if is_dialogue_active:
		return
	
	dialogue_lines = lines
	text_box_position = position
	_show_text_box()
	alert_player = false
	is_dialogue_active = true

func _show_text_box():
	text_box = text_box_scene.instantiate()
	text_box.finished_displaying.connect(dialogue_finished)
	get_tree().root.add_child(text_box)
	text_box.global_position = text_box_position
	text_box.display_text(dialogue_lines[current_line_index])
	can_advance_line = false

func dialogue_finished():
	can_advance_line = true

func _unhandled_input(event):
	if (
		event.is_action_pressed("advance dialogue") &&
		is_dialogue_active &&
		can_advance_line
	):
		text_box.queue_free()
		
		current_line_index += 1
		if current_line_index >= dialogue_lines.size():
			is_dialogue_active = false
			current_line_index = 0
			if alert_player:
				print("alerting player")
				Globals.current_player._on_player_animation_finished.connect(_on_player_animation_complete)
				Globals.current_player.on_dialog_complete()
			else:
				emit_signal("dialogue_complete")
			return
		
		_show_text_box()

func _on_player_animation_complete(anim_name : StringName):
	print(anim_name, " animation finished")
	if anim_name == "Yawn":
		emit_signal("dialogue_complete")
		Globals.current_player._on_player_animation_finished.disconnect(_on_player_animation_complete)
