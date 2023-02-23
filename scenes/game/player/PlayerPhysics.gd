extends RigidBody2D

export var engine_thrust = 25000
export var spin_thrust = 100000

var thrust = Vector2()
var rotation_dir = 0
var screensize

func _ready():
	screensize = get_viewport().get_visible_rect().size

func get_input():
	if Input.is_action_pressed("move_forward"):
		thrust = transform.y * -engine_thrust
	else:
		thrust = Vector2()
	rotation_dir = 0
	if Input.is_action_pressed("turn_right"):
		rotation_dir += 1
	if Input.is_action_pressed("turn_left"):
		rotation_dir -= 1

func _process(_delta):
	get_input()

func _physics_process(delta):
	applied_force = thrust *delta
	applied_torque = rotation_dir * spin_thrust * delta
