extends StaticBody2D

@onready var animacionAdelante=$AnimatedSprite2D;
# Called when the node enters the scene tree for the first time.
func _ready():
	var random_choice =  randi_range(1, 2)  # Generate a random number between 0 and 2
	if random_choice == 1:
		animacionAdelante.play("amarillo")
	else:
		animacionAdelante.play("rojo")
	# Make sure the chosen sprite is visible
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	if body is AutoPolicia:
		print("Chocaste con un auto")
		body.bajar_vida();
