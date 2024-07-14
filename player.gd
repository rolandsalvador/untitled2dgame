extends CharacterBody2D

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x != 0 and Input.is_action_pressed("move_right"):
		$AnimatedSprite2D.animation = "walk_right"
	elif velocity.x != 0 and Input.is_action_pressed("move_left"):
		$AnimatedSprite2D.animation = "walk_left"
	elif velocity.y != 0 and Input.is_action_pressed("move_down"):
		$AnimatedSprite2D.animation = "walk_down"
	elif velocity.y != 0 and Input.is_action_pressed("move_up"):
		$AnimatedSprite2D.animation = "walk_up"
