class_name Asteroid extends Area2D

# total health of the asteroid, adjusted by the children
@export var health = 2

# animation of the explosion
@onready var animate_explosion: AnimatedSprite2D = $AnimateExplosion

const finish_animate = .15

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_health(total_health : int):
	health = total_health

func asteroid_exited_screen():
	queue_free()

func die():
	animate_explosion.play("explosion")
	await get_tree().create_timer(finish_animate).timeout
	queue_free()

func damage():
	health -= 1
	if health == 0:
		die()

func on_body_entered(body):
	if body is SpaceShip:
		body.die()
		die()
