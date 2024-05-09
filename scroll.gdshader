shader_type canvas_item;

uniform float y_speed = .02;
uniform float x_speed = .003;

void vertex() {
	UV.y += TIME * y_speed;
	UV.x += TIME * x_speed;
}
