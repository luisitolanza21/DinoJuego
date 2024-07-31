extends Node2D

@export var npc1: PackedScene
@export var npc2: PackedScene
@export var npc3: PackedScene
@export var spawn_area: Rect2

var max_attempts = 1000

func _ready():
	randomize()
	spawn_characters()

func spawn_characters():
	var character_scenes = [npc1, npc2, npc3]
	var space_state = get_world_2d().direct_space_state

	for i in range(3):
		var attempts = 0
		var valid_position = false
		var random_position = Vector2()

		while not valid_position and attempts < max_attempts:
			random_position = Vector2(
				randf_range(spawn_area.position.x, spawn_area.position.x + spawn_area.size.x),
				randf_range(spawn_area.position.y, spawn_area.position.y + spawn_area.size.y)
			)

			# Verificar colisiones
			var query = PhysicsPointQueryParameters2D.new()
			query.position = random_position
			query.collide_with_bodies = true
			query.collide_with_areas = true
			var result = space_state.intersect_point(query)
			if result.is_empty():
				valid_position = true
			
			attempts += 1

		if valid_position:
			var character_scene = character_scenes.pop_at(randi() % character_scenes.size())
			if character_scene != null:
				var character_instance = character_scene.instantiate()
				character_instance.position = random_position
				add_child(character_instance)
			else:
				print("Warning: character_scene is null.")
		else:
			print("Could not find valid position for NPC after max attempts.")
