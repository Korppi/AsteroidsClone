extends Area2D

var vel = Vector2.ZERO

func _process(delta):
	if Input.is_action_pressed("turn_left"):
		rotate(-5*delta)
	if Input.is_action_pressed("turn_right"):
		rotate(5*delta)
	if Input.is_action_pressed("move_forward"):
		vel = lerp(vel, transform.y * -10, 5 * delta)
	else:
		vel = lerp(vel, Vector2.ZERO, 1 * delta)
	position += vel
