extends Node2D
@export var block_scene: PackedScene
@export var frequency = 3
var score = 0
var ded = false

func _ready():
	$BlockTimer.wait_time = frequency
	$Stopwatch.start()
	new_game()

func _process(delta):
	#_block_mover()
	pass

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
	
	$BlockTimer.start()
	add_child(block)
	add_child(block2)

func _on_stopwatch_timeout():
	score += 1
	$HUD.update_score(score)
	
func new_game():
	$HUD/ScoreLabel.text = "0"
	score = 0
	$Player.start($StartPosition.position)

func game_over():
	ded = true
	$Stopwatch.stop()
	$BlockTimer.stop()
	$HUD/ScoreLabel.text = "GAME OVER\nPress ENTER to try again"
	if Input.is_action_just_released("restart"):
		print("hi")
		new_game()
