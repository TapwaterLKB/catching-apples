extends Area2D

@export var speed = 400
var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size
	pass
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	#flipping sprites
	if velocity.x != 0:
		$Sprite2D.flip_v = false
		$Basket/Sprite2D.flip_v = false
		$Sprite2D.flip_h = velocity.x > 0
		$Basket/Sprite2D.flip_h = velocity.x > 0
		
	#flipping where my basket is in relation to the player
	if velocity.x > 0:
		$Basket.position.x = 95
	elif velocity.x < 0:
		$Basket.position.x = -95
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
