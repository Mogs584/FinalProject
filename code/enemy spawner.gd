extends Node2D

@export var enemy_tscn: PackedScene

# Every second spawn an enemy

func spawn_enemy():
	var new_enemy = enemy_tscn.instantiate()
	self.add_child(new_enemy)
	
	var viewport_width = get_viewport_rect().size.x
	var random_x = randf_range(0, viewport_width)
	new_enemy.position.y = 50
	new_enemy.position.x = random_x
