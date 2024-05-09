extends Node2D

var large_asteroid = preload("res://asteroids/large_asteroid.tscn")
var medium_asteroid = preload("res://asteroids/medium_asteroid.tscn")
var small_asteroid = preload("res://asteroids/small_asteroid.tscn")

var asteroids = [large_asteroid, medium_asteroid, small_asteroid]

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
	var asteroid_scene = asteroids[randi() % asteroids.size()]
	var asteroid = asteroid_scene.instantiate()
	asteroid.position = Vector2(randf_range(X_LEFTMOST, X_RIGHTMOST), -20)
	add_child(asteroid)
