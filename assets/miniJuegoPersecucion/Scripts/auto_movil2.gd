extends CharacterBody2D


@export var SPEED = 200.0



# Get the gravity from the project settings to be synced with RigidBody nodes.

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	var directionX = Input.get_axis("left", "right")
	var direccionY=Input.get_axis("up","down")
	
	
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if direccionY:
		velocity.y=direccionY*SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
