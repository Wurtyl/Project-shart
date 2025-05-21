extends Area2D

@onready var timer1sec = $Timer1sec
@onready var timerbleh = $TimerBleh
@onready var bleh = $Bleh
@onready var pop = $Pop

func _on_body_entered(body):
	print("You died!")
	if body is Player:
		body.handle_death()
