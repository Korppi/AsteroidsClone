extends Area2D

var LASER = preload("res://scenes/game/Laser/Laser.tscn")

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
	if Input.is_action_just_pressed("fire_laser"):
		var l = LASER.instance()
		l.position = $Gun.global_position
		l.rotation = rotation
		$Lasers.add_child(l)
	position += vel
