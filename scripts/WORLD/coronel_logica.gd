extends StaticBody2D
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
	
	####### MISION 1 ########
	if Misiones.mision == 1 && Misiones.continuacion == 2:
		var dialogue_resource = load(Misiones.get_current_dialogue_path())
		DialogueManager.show_dialogue_balloon(dialogue_resource, "MISION_1_3")

	elif Misiones.mision == 1: #mision 1 mostrar dialogo "MISION_1"
		var dialogue_resource = load(Misiones.get_current_dialogue_path())
		DialogueManager.show_dialogue_balloon(dialogue_resource, "MISION_1")
	
	
	##### MISION 2 ########
	if Misiones.mision == 2: 
		print("HOLA")
		Misiones.cargar_mision(Misiones.mision)
		var dialogue_resource = load(Misiones.get_current_dialogue_path())
		DialogueManager.show_dialogue_balloon(dialogue_resource, "MISION_2")
