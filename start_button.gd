extends Button
signal start_clicked


func _on_mouse_entered() -> void:
	$Sprite2D.scale.x = 2
	$Sprite2D.scale.y = 1.929

func _on_mouse_exited() -> void:
	$Sprite2D.scale.x = 1.384
	$Sprite2D.scale.y = 1.335

func _on_pressed() -> void:
	start_clicked.emit()
