extends Node2D

signal fin_dialogo()
# Esta función se llamará cuando 'listo' cambie en el script global
func _on_listo_changed(new_value):
	#print("Global.listo ha cambiado a: ", new_value)
	$Inicio.play("escape")
	fin_dialogo.emit()
	# Aquí puedes añadir el código que deseas ejecutar cuando 'listo' cambie
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.connect("listo_changed", Callable(self, "_on_listo_changed"))
	DialogueManager.show_dialogue_balloon(load("res://dialogs/DialogosPersecusión/dialogosMinijuego2.dialogue"), "dinoDialogoDeLaDinoPersecucion");
	pass;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
