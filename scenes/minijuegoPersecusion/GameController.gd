extends Node2D

@export var player_life=3;

signal vidas_actualizadas_jugador(nueva_estado_de_vidas);
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func game_over():
	Transicion.cambiar_escena("res://scenes/world.tscn");

func game_victory():
	print("Ganador")
	


func _on_dinomovil_player_hit():
	player_life=player_life-1;
	vidas_actualizadas_jugador.emit(player_life);
	if player_life == 0:
		game_over();
	pass # Replace with function body.
