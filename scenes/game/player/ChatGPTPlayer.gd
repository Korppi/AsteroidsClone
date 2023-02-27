extends Sprite

export var speed = 200

func _physics_process(delta):
	if Input.is_action_pressed("turn_left"):
		rotate(deg2rad(-120) * delta)
	elif Input.is_action_pressed("turn_right"):
		rotate(deg2rad(120) * delta)
	
	if Input.is_action_pressed("move_forward"):
		var direction = Vector2(cos(rotation), sin(rotation))
		position += direction * speed * delta
	
