extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_actualizarTiempo();
	pass


func _on_game_controller_vidas_actualizadas_jugador(nueva_estado_de_vidas):
	$HBoxContainer/vida1.visible = true if nueva_estado_de_vidas>=1 else false;
	$HBoxContainer/vida2.visible = true if nueva_estado_de_vidas>=2 else false;
	$HBoxContainer/vida3.visible = true if nueva_estado_de_vidas>=3 else false;
	$HBoxContainer/vida4.visible = true if nueva_estado_de_vidas>=4 else false;
	$HBoxContainer/vida5.visible = true if nueva_estado_de_vidas>=5 else false;


func _on_dinomovil_velocidad_player(velocidad):
	$TextureRect/Label.text="velocidad: "+str(abs(round(velocidad)));
	pass # Replace with function body.

func _actualizarTiempo():
	var t=$"../ControlTiempo".time_left;
	var minutes = int(t) / 60
	var seconds = int(t) % 60
	
	var seconds_text = str(seconds)
	if seconds < 10:
		seconds_text = "0" + seconds_text

# Formatear el tiempo con los minutos y segundos
	var time_text = "0"+str(minutes) + ":" + seconds_text;
	$TextureRect2/Label.text=time_text;
