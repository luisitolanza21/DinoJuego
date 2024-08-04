extends Node

#var listo: String = "no"
signal listo_changed(new_value)



var _listo: String = "no"
var listo: String:
	get:
		return _listo
	set(value):
		_listo = value
		emit_signal("listo_changed", _listo)

func _ready():
	# Si necesitas hacer algo cuando el nodo está listo
	pass
