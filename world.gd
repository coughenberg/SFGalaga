extends Node2D

var asteroid_scene = preload("res://asteroids/enemy.tscn")

# The left and right most positions without hitting the borders
const X_LEFTMOST = 100
const X_RIGHTMOST = 1100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_enemy_timer_timeout():
	print("spawn asteroid from world")
	var asteroid = asteroid_scene.instantiate()
	asteroid.position = Vector2(randf_range(X_LEFTMOST, X_RIGHTMOST), -20)
	add_child(asteroid)
