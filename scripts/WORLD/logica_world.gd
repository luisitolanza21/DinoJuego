extends Node

func _ready():
	# Cargar el recurso de diálogo
	Misiones.esta_en_world = true # referencia a que volvimos a la escena mundo
	$player.position = Global.dino_position
	
	if Misiones.mision == 0: #introduccion
		var dialogue_resource = load(Misiones.get_current_dialogue_path())
		DialogueManager.show_dialogue_balloon(dialogue_resource)
		
	if Misiones.mision == 1:
		Misiones.cargar_mision(Misiones.mision)
		var dialogue_resource = load(Misiones.get_current_dialogue_path())
		DialogueManager.show_dialogue_balloon(dialogue_resource)

	if Misiones.mision == 2: 
		Misiones.cargar_mision(Misiones.mision)
		var dialogue_resource = load(Misiones.get_current_dialogue_path())
		DialogueManager.show_dialogue_balloon(dialogue_resource)
		
	print("estado mision: ", Misiones.mision)
	
