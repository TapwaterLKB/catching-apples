extends Button
signal again_clicked

func _on_mouse_entered() -> void:
	$Sprite2D.scale.x = 1.52
	$Sprite2D.scale.y = 1.52

func _on_mouse_exited() -> void:
	$Sprite2D.scale.x = 1.12
	$Sprite2D.scale.y = 1.12

func _on_pressed() -> void:
	again_clicked.emit()
