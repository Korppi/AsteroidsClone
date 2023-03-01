extends Area2D

export var speed = 800
var screen_size
var laser_size

func _ready():
	$Timer.start()
	screen_size = OS.get_window_size()
	print(screen_size)
	laser_size = $Sprite.get_rect().size
	print(laser_size)

func _process(delta):
	position += -transform.y * speed * delta
	if position.x + laser_size.x < -2:
		position.x = screen_size.x + laser_size.x
	if position.x - laser_size.x > screen_size.x + 2:
		position.x = -laser_size.x
	if position.y + laser_size.y < -2:
		position.y = screen_size.y + laser_size.y
	if position.y - laser_size.y > screen_size.y + 2:
		position.y = -laser_size.y 


func _on_Timer_timeout():
	queue_free()
