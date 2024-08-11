extends Button
@onready var animated = $animacion

func _ready():
	animated.play("frente")

func _on_pressed():
	$animacion.flip_h = true
	if animated.animation == "frente":
		animated.play("lado")
	else:
		animated.play("frente")
