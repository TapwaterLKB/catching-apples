extends Area2D

@export var speed = 450
var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size
	
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	var standing = $Sprite2D
	var walking = $Walking

#moves sprites
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		walking.show()
		standing.hide()
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		walking.show()
		standing.hide()

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	#show walking and standing sprite based on whats pressed 
	if Input.is_action_just_released("move_left"):
		standing.show()
		walking.hide()
	if Input.is_action_just_released("move_right"):
		standing.show()
		walking.hide()
	
	#flipping sprites
	if velocity.x != 0:
		$Sprite2D.flip_v = false
		$Walking.flip_v = false
		$Basket/Sprite2D.flip_v = false
		$Sprite2D.flip_h = velocity.x > 0
		$Walking.flip_h = velocity.x > 0
		$Basket/Sprite2D.flip_h = velocity.x > 0
		
	#flipping where my basket is in relation to the player
	if velocity.x > 0:
		$Basket.position.x = 95
	elif velocity.x < 0:
		$Basket.position.x = -95
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)

func _on_speedy_apple_timer_timeout() -> void:
	speed += 50

func _on_end_screen_game_agaaain() -> void:
	speed = 450
