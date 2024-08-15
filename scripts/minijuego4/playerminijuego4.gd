extends CharacterBody2D
@export var speed = 1000

@onready var animated = $SpriteDinoAnimated
var direction = Vector2()
var idle_position: int = 0

var current_npc = null

@onready var caminar_sonido = $caminar

func _ready():
	$Area2D.connect("body_entered", Callable(self, "_on_body_entered"))
	$Area2D.connect("body_exited", Callable(self, "_on_body_exited"))

func _input(event):
	direction.x = Input.get_axis("left", "right")
	#direction.y = Input.get_axis("up", "down")
	
	if Global.botones == true:
		$"../Botones".visible = true
	else:
		$"../Botones".visible = false
	
	if direction.x and direction.y != 0:
		direction = Vector2(0, 0)
		
	if direction.y > 0:
		#animated.play("front_walk")
		idle_position = 1

	if direction.y < 0:
	#	animated.play("back_walk")
		idle_position = 2

	if direction.x > 0:
		#$SpriteDinoAnimated.flip_h = false
		#animated.play("side_walk")
		idle_position = 3

	if direction.x < 0:
		#$SpriteDinoAnimated.flip_h = true
		#animated.play("side_walk")
		idle_position = 3


	direction = direction.normalized()

func _physics_process(delta):
	velocity = speed * direction
	
	if velocity != Vector2.ZERO:
		if not caminar_sonido.playing:
			caminar_sonido.play()
	else:
		if caminar_sonido.playing:
			caminar_sonido.stop()
			
			
#	if velocity == Vector2(0, 0):
#		if idle_position == 1:
#			animated.play("idle_1")
#		if idle_position == 2:
#			animated.play("idle_2")
#		if idle_position == 3:
#			animated.play("idle_3")
	move_and_slide()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		animated.play("rugido")
		if current_npc:
			current_npc.player_interacted()
	elif Input.is_action_just_released("ui_accept"):
		animated.play("idle_1")  # Cambia esto a la animación normal
		#current_npc.player_interacted()

func _on_body_entered(body):
	if body.has_method("player_interacted"):
		#print("a")
		current_npc = body


func _on_body_exited(body):
	if body == current_npc:
		current_npc = null

