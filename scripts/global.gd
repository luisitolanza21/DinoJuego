extends Node

#guardar posicion del dino al cambiar de escena
var dino_position = Vector2(-2084, -1066)
#variable para ocular botones cuando hay un dialogo
var botones: bool = true


#var listo: String = "no"
signal listo_changed(new_value)

var _listo: String = "no"
var listo: String:
	get:
		return _listo
	set(value):
		_listo = value
		emit_signal("listo_changed", _listo)
		
signal puntaje_changed(new_value)

var puntaje: int = 0

		
var npc1 = 0
var npc2 = 0
var npc3 = 0

func todos_los_npc():
	puntaje = npc1 + npc2 + npc3

func _ready():
	# Si necesitas hacer algo cuando el nodo está listo
	pass
