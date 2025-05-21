extends Area2D

@onready var timer1sec = $Timer1sec
@onready var timerbleh = $TimerBleh
@onready var bleh = $Bleh
@onready var pop = $Pop

func _on_body_entered(body):
	print("You died!")
	Engine.time_scale = 0.5
	bleh.play()
	timer1sec.start()
	timerbleh.start()


func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()


func _on_timer_bleh_timeout():
	pop.play()
	
