extends Node2D

var large_asteroid_scene = preload("res://asteroids/large_asteroid.tscn")
var medium_asteroid_scene = preload("res://asteroids/medium_asteroid.tscn")
var small_asteroid_scene = preload("res://asteroids/small_asteroid.tscn")

var asteroids = [large_asteroid_scene, medium_asteroid_scene, small_asteroid_scene]

@onready var ship = $SpaceShip

@onready var laser_container = $LaserContainer

# The left and right most positions without hitting the borders
const X_LEFTMOST = 100
const X_RIGHTMOST = 1100

#var ship = null

# Called when the node enters the scene tree for the first time.
func _ready():
	assert(ship != null)
	ship.laser_shot.connect(_on_player_laser_shot)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_enemy_timer_timeout():
	var asteroid_scene = asteroids[randi() % asteroids.size()]
	var asteroid = asteroid_scene.instantiate()
	asteroid.position = Vector2(randf_range(X_LEFTMOST, X_RIGHTMOST), -20)
	add_child(asteroid)

func _on_player_laser_shot(laser_scene, location):
	var laser = laser_scene.instantiate()
	laser.global_position = location
	laser_container.add_child(laser)
