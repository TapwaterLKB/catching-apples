extends Label

@export var label_scene: PackedScene

func _on_lable_timer_timeout() -> void:
	var label = visible
	hide()
