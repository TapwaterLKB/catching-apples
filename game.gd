extends Node

@export var appletwo_scene: PackedScene
var score = 0

func _on_ready() -> void:
	pass

func _on_mob_timer_timeout() -> void:
	# create a new instance of apple scene
	var apple = appletwo_scene.instantiate()
	
	#choose a random location on path 2D
	var apple_spawn_location = $MobPath/MobSpawnLocation
	apple_spawn_location.progress_ratio = randf()
	
	# Set apple position to random position
	apple.position = apple_spawn_location.position
	
	add_child(apple)

func update_score(score):
	$ScoreLabel.text = str(score)

func _on_basket_caught(apl: Node2D) -> void:
	score += 1
	apl.queue_free()
	update_score(score)
