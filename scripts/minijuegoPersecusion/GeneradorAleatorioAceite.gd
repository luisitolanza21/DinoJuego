extends Node2D

var manchaAceite=load("res://scenes/minijuegoPersecusion/manchaDeAceite.tscn")
var numeroDeManchasAleatorias=0;

# Called when the node enters the scene tree for the first time.
func _ready():
	numeroDeManchasAleatorias=randi_range(10, 20);
	create_obstacles();
	pass # Replace with function body.

		
func create_obstacles():
	# Instanciar la escena del auto obstáculo
	print("Numero de manchas agregadas: "+str(numeroDeManchasAleatorias))
	# Asignar una posición aleatoria en y
	while(numeroDeManchasAleatorias > 0):

		var new_obs = manchaAceite.instantiate()
		var y=randf_range(377, 613);
		var x=randf_range(0, 59000);
		new_obs.position = Vector2(x, y);
		# Añadir el nuevo obstáculo a la escena actual
		add_child(new_obs)
		print("Obstáculo añadido a la escena. y="+str(y)+" Obstaculo en x ="+str(x))
		numeroDeManchasAleatorias = numeroDeManchasAleatorias -1;

