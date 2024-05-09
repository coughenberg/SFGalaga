extends StaticBody2D

func _ready():
	window_resize()

func window_resize():
	position = Vector2(get_viewport_rect().size.x / 2, get_viewport_rect().size.y)
	scale = Vector2(get_viewport_rect().size.x, 1)
