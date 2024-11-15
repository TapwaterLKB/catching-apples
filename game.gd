extends Node

@export var appletwo_scene: PackedScene
@export var apple_detector_scene: PackedScene
var gravityaplpl = 0.08
	#Gravity on my apples
var score = 0
var deathapples = 3
	#Amount of apples able to hit ground
var apples = []
#apple container
func new_game():
	$MobTimer.wait_time = 3
	deathapples = 3
	gravityaplpl = 0.08
	apples.clear()
	$Player.position.x = 580
	$GameMusic.playing = true
	$EndGameSong.playing = false
	var deathbar = apple_detector_scene.instantiate()
	add_child(deathbar)
	score = 0
	update_score()
	$SpeedyAppleTimer.start()
	$Player.position.x = 580
	$LableTimer.start()
	$MobTimer.start()
	$End_Screen.visible = false

#Randomly spawns apples
func _on_mob_timer_timeout() -> void:
	# create a new instance of apple scene
	var apple = appletwo_scene.instantiate()
	
	#choose a random location on path 2D
	var apple_spawn_location = $MobPath/MobSpawnLocation
	apple_spawn_location.progress_ratio = randf()
	apple.gravity_scale = gravityaplpl
	# Set apple position to random position
	apple.position = apple_spawn_location.position
	
	add_child(apple)
	apples.append(apple)

#Change score on sign to match score
func update_score():
	$ScoreLabel.text = str(score)

func _on_basket_caught(apl: Node2D) -> void:
	score += 1
	apples.erase(apl)
	apl.queue_free()
	update_score()
	$SoundEffect.playing = true
	
#Litsen for amount of apples hittting ground
func _on_apple_detector_death(body: Node2D) -> void:
	deathapples -= 1
	print(deathapples)
	stop_all()
	
func stop_all():
	if deathapples == 0:
		#Gets rid of all apples present on screen
		for apl in apples:
			apl.queue_free()
			#Stops spawning them
		$MobTimer.stop()
		$GameMusic.stop()
		$SpeedyAppleTimer.stop()
		$End_Screen.visible = true
		$EndGameSong.playing = true
#Button on start screen
func _on_start_screen_game_stat() -> void:
	$StartScreen.visible = false
	$TitleSongg.playing = false
	new_game()
#Loop game music
func _on_game_music_finished() -> void:
	$GameMusic.playing = true 
#Button at end game
func _on_end_game_song_finished() -> void:
	$EndGameSong.playing = true
	#Game Music loop
func _on_end_screen_game_agaaain() -> void:
	new_game()

#increases apple gravity
func _on_speedy_apple_timer_timeout() -> void:
	$SpeedyAppleTimer.start()
	$MobTimer.wait_time -= 0.3
	gravityaplpl *= 1.5
	print("WOWOAH THERE BUDDY  BOY")
	
