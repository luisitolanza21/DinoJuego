extends StaticBody2D

var current_sprite: Sprite2D;
var sprite_auto_rojo: Sprite2D
var sprite_auto_amarillo: Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite_auto_rojo = $rojo;
	sprite_auto_amarillo=$amarillo;
	
	var random_choice =  randi_range(1, 2)  # Generate a random number between 0 and 2
	if random_choice == 1:
		current_sprite = sprite_auto_rojo
	else:
		current_sprite = sprite_auto_amarillo;

	# Make sure the chosen sprite is visible
	current_sprite.visible = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	if body is AutoPolicia:
		print("Chocaste con un auto")
		body.bajar_vida();
