extends CharacterBody2D

@export var player_name = "player"
@export var dialogueResource : DialogueResource
@export var dialogueStart : String = "Start"
var listo = Global.listo

func _ready():
	$Area2D.connect("body_entered", Callable(self, "_on_body_entered"))
	$Area2D.connect("body_exited", Callable(self, "_on_body_exited"))


func _on_body_entered(body):
	print(listo)
	if body.name == player_name:
		body.set("current_npc", self)

func _on_body_exited(body):
	print(listo)
	if body.name == player_name:
		body.set("current_npc", null)

func player_interacted():
	print("Player interacted with NPC")
	
	DialogueManager.show_dialogue_balloon(load("res://dialogs/dinodetective1/minijuego1_1.dialogue"), "npc3")
	
	
