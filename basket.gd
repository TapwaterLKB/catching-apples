extends Area2D

@export var apple_scene: PackedScene

signal caught

func _ready() -> void:
	pass # Replace with function body.
	
func _process(_delta: float) -> void:
	pass
	
func _on_body_entered(body: Node2D) -> void:
	caught.emit(body)
