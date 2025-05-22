extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var animated_sprite = $AnimatedSprite2D
@onready var pop = $pop

const lines: Array[String] = [
	"KIT: Woah, this mushroom has a face.",
	"SHROOM: Yup. Aint it pretty?",
	"KIT: Awesome, I have to listen to ANOTHER mushroom talk.",
	"SHROOM: HEY! I was gonna let you through against my mom's wishes,",
	"SHROOM: But if you're gonna be mean then you can stay stuck in this lame cave.",
	"KIT: what's behind you?",
	"SHROOM: I'm not telling you anymore >:(",
	"KIT: Welll, there is this axe...",
	"SHROOM: ARE YOU THREATENING ME???",
	"KIT: Do you feel threatened..?",
	"SHROOM: My mom was right about you.",
	"SHROOM: I was going to forgive you for EATING ME",
	"SHROOM: but since you're being mean I guess you can just go :(",
	"KIT: Wait...",
	"KIT: You're Shroomthalomew?",
	"SHROOMTHOLAMEW: The one and only!",
	"KIT: How are you here if I ate you?",
	"SHROOMTHOLAMEW: My mom can remake me teehee",
	"KIT: WHAT!?",
	"SHROOMTHOLAMEW: Yep.",
	"KIT: Then why was she so mad??",
	"SHROOMTHOLAMEW: She's evil :p",
	"KIT: oh...",
	"SHROOMTHOLAMEW: yeah..",
	"KIT: ...",
	"KIT: so can I go now?",
	"SHROOMTHOLAMEW: sure man i dont care haha"
]

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	
func _on_interact():
	interaction_area.queue_free()
	DialogueManager.start_dialogue(global_position, lines)
	await DialogueManager.dialogue_complete
	pop.play()
	animated_sprite.play("pop")



func _on_animated_sprite_2d_animation_finished():
	queue_free()
