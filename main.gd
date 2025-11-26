extends Node2D
@export var block_scene: PackedScene
@export var frequency = 3
var score = 0
var ded = false
var high_score = 0

func _ready():
	$BlockTimer.wait_time = frequency
	$Stopwatch.start()
	$LevelTheme.play()
	$HUD/ScoreLabel.label_settings.font_size = 60

func _process(delta):
	#_block_mover()
	if Input.is_action_just_released("restart"):
		new_game()
	if($Background.position.x <= -950):
		$Background.position.x = 2500
	else:
		$Background.position.x -= 5
	
	if(score < 10):
		$HUD/ScoreLabel.label_settings.font_color = Color.GHOST_WHITE
	elif(score < 20):
		$HUD/ScoreLabel.label_settings.font_color = Color.SKY_BLUE
	elif (score < 50):
		$HUD/ScoreLabel.label_settings.font_color = Color.LAWN_GREEN
		
		
	elif (score < 100):
		$HUD/ScoreLabel.label_settings.font_color = Color.YELLOW
	else:
		$HUD/ScoreLabel.label_settings.font_color = Color.CRIMSON

func _on_timeout():
	var block = block_scene.instantiate()
	var block2 = block_scene.instantiate()
	var spawn_y = $Player.screenSize.y
	block.position.x = 700
	block.position.y = 200
	block2.position.x = 700
	block2.position.y = -450
	
	if(block.scale_y > 20 and block2.scale_y > 20):
		block.scale_y = 25
		block2.scale_y = 25
	
	add_child(block)
	add_child(block2)

func _on_stopwatch_timeout():
	score += 1
	$HUD.update_score(score)
	
func new_game():
	ded = false
	$HUD/ScoreLabel.text = "0"
	score = 0
	$Player.velocity.x = 0
	$Player.velocity.y = 0
	$Player.start($StartPosition.position)
	$Stopwatch.start()
	$BlockTimer.start()
	$HUD/HighScore.text = "High Score: " + str(high_score)
	$LevelTheme.play()

func game_over():
	ded = true
	if(score > high_score):
		high_score = score
	$Stopwatch.stop()
	$BlockTimer.stop()
	$HUD/ScoreLabel.text = "GAME OVER\nPress ENTER to try again"
	$LevelTheme.stop()
	$DeathSong.play()
