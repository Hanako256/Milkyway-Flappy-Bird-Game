extends Area2D
var scale_y = randi_range(1, 20)
var height

func _ready():
	$Block.scale = Vector2(1, scale_y)
	$Collisions.scale = Vector2(1, scale_y)
	#height = $Block.get_rect().y / 2
	
func _process(delta):
	var velocity = (Vector2.ZERO)
	velocity.x -= 100
	position += velocity * delta
	
func _return_height() -> float:
	return height
