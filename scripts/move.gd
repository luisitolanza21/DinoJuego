class_name player
extends CharacterBody2D
@export var speed = 1000

@onready var animated = $SpriteDinoAnimated

var direction = Vector2()
var idle_position: int = 0 

@onready var camara = $Camera2D

func _input(event):
	direction.x = Input.get_axis("left","right")
	direction.y = Input.get_axis("up","down")
	#camara.zoom = Vector2(1,1)
	
	if direction.x and direction.y != 0:
		direction = Vector2(0,0)
		
	if direction.y > 0:
		animated.play("front_walk")
		idle_position = 1
		#camara.zoom = Vector2(1,1)
	if direction.y < 0:
		animated.play("back_walk")
		idle_position = 2
		#camara.zoom = Vector2(0.1,0.1)
		
	if direction.x > 0:
		$SpriteDinoAnimated.flip_h = false
		animated.play("side_walk")
		idle_position = 3
		#camara.zoom = Vector2(1,1)
	if direction.x < 0:
		$SpriteDinoAnimated.flip_h = true
		animated.play("side_walk")
		idle_position = 3
		#camara.zoom = Vector2(1,1)

	direction.normalized()	
	
func _physics_process(delta):
	
	velocity = speed * direction
	if velocity == Vector2(0,0):
		if idle_position == 1:
			animated.play("idle_1")
		if idle_position == 2:
			animated.play("idle_2")
		if idle_position == 3:
			animated.play("idle_3")
	move_and_slide()
	
