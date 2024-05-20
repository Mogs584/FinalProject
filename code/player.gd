extends CharacterBody2D

@export var speed: int = 50
var screensize = Vector2(1152, 648)
var health = 100
var enemy = null


func _process(delta):
	
	var input_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if input_vector.length() > 0:
		velocity = input_vector * speed
		$AnimatedSprite2D.animation = "walking"
		$AnimatedSprite2D.play()
	else:
		velocity = Vector2.ZERO
		$AnimatedSprite2D.animation = "idle"
		$AnimatedSprite2D.play()
	
	if input_vector.x != 0:
		$AnimatedSprite2D.flip_h = input_vector.x < 0
		
	#if health <= 0:
		#game_over()

func _physics_process(delta):
	move_and_slide()

#health and damage

#func dead():
#	if health <= 0:
#		game_over()


#func _on_enemy_collision_body_entered(body):
#	if body.is_in_group("enemy"):
#		enemy = body
#		queue_free()
