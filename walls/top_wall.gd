extends StaticBody2D

var topBorderWindowToUpdateWithViewport = -375

func _ready():
	window_resize()

func window_resize():
	position = Vector2(get_viewport_rect().size.x / 2, topBorderWindowToUpdateWithViewport)
	scale = Vector2(get_viewport_rect().size.x, 1)
