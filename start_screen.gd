extends Node2D

signal game_stat

func _on_start_button_start_clicked() -> void:
	game_stat.emit()
	
