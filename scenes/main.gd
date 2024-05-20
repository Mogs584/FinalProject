extends Node2D
@export var enemy_tscn: PackedScene
var enemySpawnRange = Vector2.ZERO
var wave = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_enemy()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_tree().get_nodes_in_group("enemy").size() == 0:
		wave += 1
		spawn_enemy()

func spawn_enemy():
	for i in wave + 4:
		var new_enemy = enemy_tscn.instantiate()
		add_child(new_enemy)
		#new_enemy.screensize = screensize
		new_enemy.position = Vector2(randi_range(16, 1100), randi_range(16, 336))

func game_over():
	pass
