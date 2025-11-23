extends Area2D
var scale_y = randi_range(1, 30)
var height

func _ready():
	$Block.scale = Vector2(1, scale_y)
	$Collisions.scale = Vector2(1, scale_y)
	height = $Block.texture.get_height()
	
func _process(delta):
	var velocity = (Vector2.ZERO)
	velocity.x -= 100
	position += velocity * delta

func block_killer(boo):
	if (boo == true):
		queue_free()
