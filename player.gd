extends Area2D

@export var speed = 400
var screen_size



func _ready() -> void:
	screen_size = get_viewport_rect().size
	
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	if velocity.x != 0:
	
		$Sprite2D.flip_v = false
		$Sprite2D.flip_h = velocity.x > 0
		

	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
