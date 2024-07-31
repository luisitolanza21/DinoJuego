extends StaticBody2D


#script para desvanecer edificios cuando pasas por detras
func _on_area_2d_body_entered(body):
	if body is player:
		modulate.a = 0.5
		print("entro al area a desvanecer")



func _on_area_2d_body_exited(body):
	if body is player:
		modulate.a = 255
		print("salio del area a desvanecer")
