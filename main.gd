extends Node2D
@export var block_scene: PackedScene
@export var frequency = 3

func _ready():
	$BlockTimer.wait_time = frequency

func _process(delta):
	#_block_mover()
	pass

func _on_timeout():
	var block = block_scene.instantiate()
	var block2 = block_scene.instantiate()
	var spawn_y = 0
	block.position.x = 700
	block.position.y = spawn_y
	block2.position.x = 700
	block2.position.y = -500
	#block.position = $Player/Animation.position
	$BlockTimer.start()
	add_child(block)
	add_child(block2)
