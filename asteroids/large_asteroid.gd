extends "res://asteroids/asteroids.gd"

func _ready():
	super.set_health(3)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += 1


func _on_body_entered(body):
	super.on_body_entered(body)

func _on_la_visible_screen_exited():
	super.asteroid_exited_screen()
