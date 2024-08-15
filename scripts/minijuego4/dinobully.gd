extends CharacterBody2D

@export var MAX_SPEED_REF= 200;
@export var MIN_SPEED_REF= 200;

@export var ACCELERATION = 200;

@export var DECELERATION = 200.0;

@onready var animated = $Dinoanimaciones

@export var posicionParaDesaparecerX=-400;

var MAX_SPEED_VERTICAL = -1;
var MAX_SPEED;
var chocan = false

var velocity_target = Vector2.ZERO


var auto = null


func _ready():
	#$choqueperder.connect("area_entered", Callable(self, "_on_area_choqueperder"))
	MAX_SPEED=randf_range(MIN_SPEED_REF, MAX_SPEED_REF);
	
	
	var random_choice =  randi() % 3  # Generate a random number between 0 and 2
	
	match random_choice:
		0:
			animated.play("NPC1")
		1:
			animated.play("NPC2")
		2:
			animated.play("NPC3")
	
	
func _on_area_choqueperder(area):
		$".".queue_free()
		#DialogueManager.show_dialogue_balloon(load("res://dialogs/dinodetective1/minijuego1_1.dialogue"), "npc1")

func player_interacted():
	$".".queue_free()
	# Lógica adicional aquí
	
func _process(delta):
	#print($".".position.x)
	if chocan:
		var other_car = $adelante.get_overlapping_areas()[0].get_parent()
		if other_car.MAX_SPEED > -1:
			if other_car and other_car != self and other_car.MAX_SPEED != MAX_SPEED:
				MAX_SPEED = other_car.MAX_SPEED
			#	print("MAX_SPEED actualizado desde el auto de delante: ", MAX_SPEED)
		
	if $".".position.y < 180:
		$".".queue_free()
		Transicion.cambiar_escena("res://scenes/minijuego4/perdiste.tscn")
	

func _physics_process(delta):
	var input_direction = 0;
	var input_vertical = -1;
	var is_braking =0;  # Suponiendo que "ui_accept" es la acción de la barra espaciadora
	
	if input_vertical > 0:
		velocity_target.y = clamp(velocity_target.y + ACCELERATION * delta, 0, MAX_SPEED)
	elif input_vertical < 0:
		velocity_target.y = clamp(velocity_target.y - ACCELERATION * delta, -MAX_SPEED, 0)
	else:
		# Desaceleración vertical
		velocity_target.y = move_toward(velocity_target.y, 0, DECELERATION * delta)
		
	velocity.y = move_toward(velocity.y, velocity_target.y, ACCELERATION * delta)
	move_and_slide()

