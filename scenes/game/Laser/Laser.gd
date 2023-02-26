extends Area2D

export var speed = 800

func _ready():
	$Timer.start()

func _process(delta):
	position += -transform.y * speed * delta


func _on_Timer_timeout():
	queue_free()
