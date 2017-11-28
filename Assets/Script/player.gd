extends KinematicBody2D

var direction = Vector2()
var last_direction = Vector2()

const TOP = Vector2(0, -1)
const RIGHT = Vector2(1, 0)
const DOWN = Vector2(0, 1)
const LEFT = Vector2(-1, 0)

var speed = 0
const MAX_SPEED = 600

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if direction.x != 0 or direction.y != 0:
		last_direction = direction
		print(last_direction)

	direction.x = Input.is_action_pressed("toggle_right") - Input.is_action_pressed("toggle_left")

	direction.y = Input.is_action_pressed("toggle_down") - Input.is_action_pressed("toggle_up")

	# print(last_direction)
	var velocity = direction.normalized() * MAX_SPEED * delta
	move(velocity)