extends Node

func _ready():
	# Cargar el recurso de diálogo
	Misiones.esta_en_world = true # referencia a que volvimos a la escena mundo
	$player.position = Global.dino_position
	if Misiones.mision == 1:
		var dialogue_resource = load(Misiones.get_current_dialogue_path())
		# Mostrar el diálogo
		DialogueManager.show_dialogue_balloon(dialogue_resource)
		Misiones.mision = 2
		Misiones.cargar_mision(Misiones.mision)
		print("estado mision: ", Misiones.mision)
		
	if Misiones.mision == 2 && Misiones.continuacion==3: # cargar ultimo dialogo de la mision 2
		var dialogue_resource = load(Misiones.get_current_dialogue_path())
		DialogueManager.show_dialogue_balloon(dialogue_resource)
		Misiones.mision = 3
		Misiones.cargar_mision(Misiones.mision)

