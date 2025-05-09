extends CanvasLayer

const CHAR_READ_RATE = 0.5

@onready var textbox_container = $TextboxContainer
@onready var start_symbol = $TextboxContainer/MarginContainer/HBoxContainer/Start
@onready var end_symbol = $TextboxContainer/MarginContainer/HBoxContainer/End
@onready var label = $TextboxContainer/MarginContainer/HBoxContainer/Label
@onready var tween = create_tween()

func _ready():
	hide_textbox()
	add_text("this text is going to be added")

func hide_textbox():
	start_symbol.text = ""
	end_symbol.text = ""
	label.text = ""
	textbox_container.hide()

func show_textbox():
	start_symbol.text = "*"
	textbox_container.show()

func add_text(next_text):
	label.text = next_text
	show_textbox()
	tween.tween_property(label, "percent_visible", 0.0, 1.0)
