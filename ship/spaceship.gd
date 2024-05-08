extends CharacterBody2D

# Screen borders
var screenWidth = get_viewport_rect().size.x
var screenHeight = get_viewport_rect().size.y

# Ship constant speed
const speed = 7.5

func _init():
	pass
	#set_floor_max_angle(0)
	#set_ceiling_max_angle(screenHeight)
	#set_wall
	
func get_velocity_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var vel = input_direction * speed
	return vel
	
func get_shooting_input():
	var is_key_pressed = Input.is_physical_key_pressed(KEY_SPACE)
	print(is_key_pressed)

func _physics_process(delta):
	var vel = get_velocity_input()
	var collision = move_and_collide(vel)


func _on_button_pressed():
	pass # Replace with function body.
