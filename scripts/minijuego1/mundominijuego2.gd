extends Node2D

@export var escena : String = "res://scenes/minijuego1/nivel2/seleccion_culpable2.tscn"
	
# Esta función se llamará cuando 'listo' cambie en el script global
func _on_listo_changed(new_value):
	#print("Global.listo ha cambiado a: ", new_value)
	Transicion.cambiar_escena(escena)
	# Aquí puedes añadir el código que deseas ejecutar cuando 'listo' cambie

# Called when the node enters the scene tree for the first time.
func _ready():
   # Conectar la señal 'listo_changed' a la función '_on_listo_changed'
	Global.botones = false
	DialogueManager.show_dialogue_balloon(load("res://dialogs/dinodetective1/minijuego1_2.dialogue"), "start")
	Global.connect("listo_changed", Callable(self, "_on_listo_changed"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.npc1 == 1:
		$Botones/MisionIndicator1.hide()
	if Global.npc2 == 1:
		$Botones/MisionIndicator2.hide()
	if Global.npc3 == 1:
		$Botones/MisionIndicator3.hide()
	if Global.npc1 + Global.npc2 + Global.npc3 == 3:
		$Botones/MisionIndicator4.show()
		
