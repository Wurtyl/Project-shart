extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var boom = $BOOM

const lines: Array[String] = [
	"SHROOM: You're Finally Here.",
	"KIT: ...hello??",
	"SHROOM: Hello Kit.",
	"KIT: ARE YOU A TALKING MUSHROOM?????",
	"KIT: and and...",
	"KIT: how do you know my name??",
	"SHROOM: I Know Many Things",
	"SHROOM: I Am Anita The All knowing",
	"ANITA: And I Know That You ATE MY SON!!!!",
	"ANITA: Shroomthalomew Was A Beuatiful Baby Boy!!",
	"KIT: I ATE YOUR SON???",
	"ANITA: YES YOU ATE MY SON!!",
	"KIT: ...",
	"KIT: sorry.",
	"ANITA: WHY WOULD YOU EAT A RANDOM MUSHROOM GROWING IN YOUR BACKYARD??",
	"KIT: I eat a lot of things dude",
	"KIT: I'm a cat man I eat bugs out of my fur and throw up hairballs.",
	"KIT: ...",
	"KIT: ..and then I eat those too.",
	"ANITA: You Are Disgusting.",
	"KIT: Preach.",
	"ANITA: ...",
	"KIT: ...",
	"ANITA: Well.",
	"ANITA: I Have No Further Use For You",
	"ANITA: I Condemn You To An Eternity In My Cave",
	"ANITA: Until You Meet The Same Fate As Those Silly Cave Explorers.",
	"KIT: aww duuuude",
	"ANITA: SILENCE!!",
	"ANITA: YOU KILLED MY SON!!!",
	"ANITA: BE GONE!!!"
]

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	DialogueManager.start_dialogue(global_position, lines)
	interaction_area.queue_free()
	await DialogueManager.dialogue_complete
	boom.play()
	GlobalCanvasLayer.on_transition_finished.connect(load_game_scene)
	GlobalCanvasLayer.transition()

func load_game_scene():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
