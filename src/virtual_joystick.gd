extends Node2D

var velocity

var radius = 100

@onready var joystick = $Joystick

func _process(delta):
	
	velocity = Vector2.ZERO # The joysticks's movement vector.
	if Input.is_action_pressed("ui_up"):
		velocity.y -=1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1

	joystick.position = velocity * radius
