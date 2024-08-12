extends RichTextLabel
var puntos = 20
var prev_puntaje = 0

func _ready():
	$".".text = "autos restantes:\n" + str(puntos)
	prev_puntaje = $"../..".puntaje

func _process(delta):
	var current_puntaje = $"../..".puntaje
	if current_puntaje != prev_puntaje:
		$".".text = "autos restantes:\n" + str(puntos - current_puntaje)
		prev_puntaje = current_puntaje
		
		if puntos - current_puntaje == 0:
			$"..".visible = false
			Transicion.cambiar_escena("res://scenes/world.tscn")


