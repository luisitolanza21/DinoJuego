extends Node
#var coronel_position: Vector2
#var npc_mision1_position: Vector2
#var npc_mision2_position: Vector2
func _ready():
	#poision para marcar la flecha que sigue la mision
	#coronel_position = Vector2(230,450)
	#npc_mision1_position = Vector2(395,2790)
	#npc_mision2_position= Vector2(-2320, 2450)
	#
	# Cargar el recurso de diálogo
	Misiones.esta_en_world = true # referencia a que volvimos a la escena mundo
	$player.position = Global.dino_position
	
	if Misiones.mision == 0: #introduccion
		var dialogue_resource = load(Misiones.get_current_dialogue_path())
		DialogueManager.show_dialogue_balloon(dialogue_resource)
		
	if Misiones.mision == 1 && Misiones.continuacion == 2: # FINAL DE MINOJUEGO 1 DIALOGO
		Misiones.cargar_mision(Misiones.mision)
		var dialogue_resource = load(Misiones.get_current_dialogue_path())
		DialogueManager.show_dialogue_balloon(dialogue_resource, "MISION_1_2")

		
	if Misiones.mision == 2 && Misiones.continuacion == 3: #FINAL DE MINIJUEGO 2 DIALOGO
		Global.botones = false
		Misiones.cargar_mision(Misiones.mision)
		var dialogue_resource = load(Misiones.get_current_dialogue_path())
		DialogueManager.show_dialogue_balloon(dialogue_resource, "MISION_2_3")
	
	if Misiones.mision == 3 && Misiones.continuacion == 2: #FINAL DE MINIJUEGO 2 DIALOGO
		Misiones.cargar_mision(Misiones.mision)
		var dialogue_resource = load(Misiones.get_current_dialogue_path())
		DialogueManager.show_dialogue_balloon(dialogue_resource, "MISION_3_2")
		
	if Misiones.mision == 4 && Misiones.continuacion == 2: #FINAL DE MINIJUEGO 2 DIALOGO
		Misiones.cargar_mision(Misiones.mision)
		var dialogue_resource = load(Misiones.get_current_dialogue_path())
		DialogueManager.show_dialogue_balloon(dialogue_resource, "MISION_4_2")
		
	print("estado mision: ", Misiones.mision)
	
