class_name SpaceShip extends CharacterBody2D

# Screen borders
var screenWidth = get_viewport_rect().size.x
var screenHeight = get_viewport_rect().size.y

# Ship constant speed
@export var speed = 7.5

var laser_scene = preload("res://normal_laser.tscn")

signal laser_shot(laser_scene, location)

@onready var muzzle = $Muzzle

@onready var animate_shots: AnimatedSprite2D = $AnimateShots

var shoot_cd = false

const laser_cooldown_rate = 0.5

const laser_animation = 0.08

func _init():
	pass

func _process(delta):
	if Input.is_action_pressed("shoot") && !shoot_cd:
		shoot_cd = true
		animate_shots.play("shoot")
		shoot()
		await get_tree().create_timer(laser_cooldown_rate).timeout
		shoot_cd = false

func get_velocity_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var vel = input_direction * speed
	return vel

func get_shooting_input():
	var is_key_pressed = Input.is_physical_key_pressed(KEY_SPACE)

func _physics_process(delta):
	var vel = get_velocity_input()
	var collision = move_and_collide(vel)


func shoot():
	await get_tree().create_timer(laser_animation).timeout
	laser_shot.emit(laser_scene, muzzle.global_position)

func die():
	queue_free()
