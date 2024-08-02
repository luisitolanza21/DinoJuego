extends CharacterBody2D

@export var player_name = "Player"
@export var dialogueResource : DialogueResource
@export var NPC_dialogue : Resource
@export var dialogueStart : String = "Start"
var window = null

func _ready():
	$Area2D.connect("body_entered", Callable(self, "_on_body_entered"))
	$Area2D.connect("body_exited", Callable(self, "_on_body_exited"))


func _on_body_entered(body):
	if body.name == player_name:
		print("Player entered NPC area")
		body.set("current_npc", self)

func _on_body_exited(body):
	if body.name == player_name:
		print("Player exited NPC area")
		body.set("current_npc", null)

func player_interacted():
	print("Player interacted with NPC")
	#NPC_dialogue.emit(NPC_dialogue,"start")
	#DialogueManager.show_dialogue_balloon(load("res://dialogs/dinodetective1/npc1.dialogue"), "this_is_a_node_title")
	
