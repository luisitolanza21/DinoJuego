extends Node2D

var autoObstaculo=load("res://scenes/minijuegoPersecusion/autoObstaculo.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var a=1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	
	if $TiempoGen.is_stopped() and a==1:
		create_obstacles();
		a=2;
		$TiempoGen.start();

		
	
		
func create_obstacles():
	# Instanciar la escena del auto obstáculo
	var new_obs = autoObstaculo.instantiate()
	if new_obs:
		print("Nuevo obstáculo instanciado.")
	# Asignar una posición aleatoria en y

	var y=randf_range(390, 580)
	new_obs.position = Vector2(0, y);
	# Añadir el nuevo obstáculo a la escena actual
	add_child(new_obs)
	print("Obstáculo añadido a la escena. y="+str(y))

