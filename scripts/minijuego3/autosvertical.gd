extends CharacterBody2D

@export var MAX_SPEED_REF= 500;
@export var MIN_SPEED_REF= 200;

@export var ACCELERATION = 400;

@export var DECELERATION = 200.0;

@export var SUBIR=false;
@export var BAJAR=false;
@export var IR_ADELANTE=true;
@export var RETROCEDER=false;
@export var posicionParaDesaparecerX=-400;

var MAX_SPEED = -1;
var MAX_SPEED_VERTICAL;


var chocan = false
var POSICION = 1
#ALEATORIZANDO SPRITESÇ
var current_sprite: Sprite2D;
var sprite_auto_rojo: Sprite2D
var sprite_auto_verde: Sprite2D
var sprite_auto_amarillo: Sprite2D

var sprite: AnimatedSprite2D;
var rojo: AnimatedSprite2D
var verde: AnimatedSprite2D
var amarillo: AnimatedSprite2D


var velocity_target = Vector2.ZERO


var auto = null


func _ready():
	#$Area2D.connect("body_entered", Callable(self, "_on_body_entered"))
	#$adelante.connect("area_entered", Callable(self, "_on_area_front_entered"))
	#$adelante.connect("area_exited", Callable(self, "_on_area_front_exited"))
	#$atras.connect("area_entered", Callable(self, "_on_area_back_entered"))
	sprite_auto_rojo = $auto_rojo
	sprite_auto_verde = $auto_verde
	sprite_auto_amarillo=$auto_amarillo
	
	MAX_SPEED_VERTICAL= 300;
	
	
	var random_choice =  randi() % 3  # Generate a random number between 0 and 2
	if random_choice == 0:
		sprite = $verde;
	if random_choice == 1:
		sprite = $amarillo;
	else:
		sprite = $rojo;
	# Make sure the chosen sprite is visible
	sprite.visible = true
	
func _on_area_front_entered(area):
	if area.get_parent() != self:
		chocan = true

func _on_area_front_exited(area):
	if area.get_parent() != self:
		chocan = false

func _on_area_back_entered(area):
	if area.get_parent() != self:
		var other_car = area.get_parent()
		other_car.MAX_SPEED_VERTICAL = MAX_SPEED_VERTICAL
	

func _process(delta):
#	print($".".position.x)
	if chocan:
		var other_car = $adelante.get_overlapping_areas()[0].get_parent()
		if other_car and other_car != self and other_car.MAX_SPEED_VERTICAL != MAX_SPEED_VERTICAL:
			MAX_SPEED_VERTICAL = other_car.MAX_SPEED_VERTICAL
	
		
	if $".".position.y > 900 or position.y < -800:
		$".".queue_free()
	

func _physics_process(delta):
	var input_direction = 0;
	var input_vertical = POSICION;
	var is_braking =0;  # Suponiendo que "ui_accept" es la acción de la barra espaciadora

	# Aceleración horizontal


	# Aceleración vertical (solo si hay movimiento horizontal)
	#if abs(velocity.x) > 0.1:  # Pequeña tolerancia para evitar saltos
	if input_vertical > 0:
		velocity_target.y = clamp(velocity_target.y + ACCELERATION * delta, 0, MAX_SPEED_VERTICAL)
	elif input_vertical < 0:
		velocity_target.y = clamp(velocity_target.y - ACCELERATION * delta, -MAX_SPEED_VERTICAL, 0)
	else:
		# Desaceleración vertical
		velocity_target.y = move_toward(velocity_target.y, 0, DECELERATION * delta)
#	else:
#		velocity_target.y = 0  # Forzar a detener el movimiento vertical
			# Frenado (se aplica si se presiona la barra espaciadora)

		
		
	velocity.x = move_toward(velocity.x, velocity_target.x, ACCELERATION * delta)
	velocity.y = move_toward(velocity.y, velocity_target.y, ACCELERATION * delta)
	move_and_slide()

