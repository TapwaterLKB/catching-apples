extends Area2D

@export var apple_scene: PackedScene

signal caught

func _process(_delta: float) -> void:
	if Input.is_action_pressed("move_right"):
		$CollisionPolygon2D3.position.x = 90
	
func _on_body_entered(body: Node2D) -> void:
	caught.emit(body)
