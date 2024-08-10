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
	if Misiones.esta_en_world: # haciendo referencia a que el npc esta en el mundo
		if Misiones.mision == 3:
			Misiones.continuacion = 4
			DialogueManager.show_dialogue_balloon(load("res://dialogs/world/coronel_primera_primera_misión.dialogue"))
			
		else:
			Misiones.continuacion = 2
			var dialogue_resource = load(Misiones.get_current_dialogue_path())
			DialogueManager.show_dialogue_balloon(dialogue_resource)
			Global.dino_position = $"../../player".position #guardar posicion para persistencia en la escena

	else:
		print("Player interacted with NPC")
		DialogueManager.show_dialogue_balloon(load("res://dialogs/dinodetective1/minijuego1_1.dialogue"), "npc2")
		
