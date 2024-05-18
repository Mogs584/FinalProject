extends CharacterBody2D

@export var speed: int = 50

var screensize = Vector2(1152, 648)

#hello

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	position += velocity * speed * delta
	
	if velocity.length() > 0:
		$AnimatedSprite2D.animation = "walking"
	else:
		$AnimatedSprite2D.animation = "idle"
	if velocity.x != 0:
		$AnimatedSprite2D.flip_h = velocity.x < 0

func _physics_process(delta):
	velocity *= speed
	move_and_slide()
