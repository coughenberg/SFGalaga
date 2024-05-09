extends StaticBody2D

func _ready():
	window_resize()

func window_resize():
	position = Vector2(get_viewport_rect().size.x,get_viewport_rect().size.y / 2)
	scale = Vector2(1, get_viewport_rect().size.y)
