extends Area2D

var enemyTypes = []

# Time in seconds per spawn, increases based on level
var spawnTimer = 2.0

# Running timer
var timer = 0.0

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var enemy = load("res://asteroids/large_asteroid.gd")

func _ready():
	enemyTypes.append(enemy)
	#enemyTypes.append(load("res://asteroids/small_asteroid.gd"))
	#enemyTypes.append(load("res://asteroids/medium_asteroid.gd"))
	timer = spawnTimer
	set_process(true)
	

func _physics_process(delta):
	velocity = Vector2(0, SPEED*delta)
	move_and_slide()
	timer -= delta
	#if timer <= 0:
		#spawn_enemy()
		#timer = spawnTimer

# Choose a random enemy and spawn it
func spawn_enemy():
	print("...spawning enemy...")
	var enemy_scene = enemyTypes[randi() % enemyTypes.size()]
	var enemy_instance = enemy_scene.instance()
	add_child(enemy_instance)
