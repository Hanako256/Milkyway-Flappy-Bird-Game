extends Area2D
signal hit

@export var jumpStrength = 200
var screenSize
var velocity

func _ready():
	screenSize = get_viewport_rect().size
	$Animation.play("default")
	velocity = (Vector2.ZERO)

func _process(delta):
	if Input.is_action_just_released("jump"):
		$Animation.play("jump")
		#print($Animation.position.y)
		velocity.y = -jumpStrength
		$AnimationTimer.start(0.5)
	else:
		velocity.y += (jumpStrength * 1.5) * delta
		
	#if velocity.y < 0:
		#$Animation.play("jump")
		##velocity = velocity.normalized() #This line was from the docs tutorial, unsure if I have to use it or not
	#else:
		#$Animation.play("default")
	position += velocity * delta
	#print(velocity.y)
	#position = position.clamp(Vector2.ZERO, screenSize)


func _on_animation_timeout():
	$Animation.play("default")

func _on_area_entered(body):
	hide()
	hit.emit()
	$Collisions.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$Collisions.disabled = false
