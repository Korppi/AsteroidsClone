extends Area2D

var LASER = preload("res://scenes/game/Laser/Laser.tscn")

var vel = Vector2.ZERO
var screen_size
var player_size

func _ready():
	screen_size = OS.get_window_size()
	print(screen_size)
	player_size = $PlayerShipType/PlayerSprite.get_rect().size
	print(player_size)

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
	if position.x + player_size.x < -2:
		position.x = screen_size.x + player_size.x
	if position.x - player_size.x > screen_size.x + 2:
		position.x = -player_size.x
	if position.y + player_size.y < -2:
		position.y = screen_size.y + player_size.y
	if position.y - player_size.y > screen_size.y + 2:
		position.y = -player_size.y 
		
