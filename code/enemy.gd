extends CharacterBody2D

@export var speed = 25
var player = null

@onready var animated_sprite = $AnimatedSprite2D

func _process(delta):
	
	if velocity.length() > 0:
		$AnimatedSprite2D.animation = "walking"
	else:
		$AnimatedSprite2D.animation = "idle"
	if velocity.x != 0:
		$AnimatedSprite2D.flip_h = velocity.x > 0



func _physics_process(delta):
	if player:
		print("Player detected!")
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * speed
		animated_sprite.flip_h = velocity.x > 0
		if not animated_sprite.is_playing() or animated_sprite.animation != "hit":
			print("Play 'hit' animation")
			animated_sprite.animation = "hit"
			animated_sprite.play()
	else:
		velocity = Vector2.ZERO
		animated_sprite.stop()
		animated_sprite.frame = 0
	
	move_and_slide()
	

func _on_detection_range_area_entered(body):
	if body.is_in_group("player"):
		player = body
		$AnimatedSprite2D.animation = "hit"

func _on_detection_range_body_exited(body):
	if body.is_in_group("player"):
		player = null
		$AnimatedSprite2D.animation = "idle"


func _on_hit_player_body_entered(body):
	$AnimatedSprite2D.animation = "hit"
