extends KinematicBody2D

# Shoot
var timeNextShoot = 0
const SHOOT_MARGIN = 15

# Move
const MAX_SPEED = 100
var speed = Vector2(0,0)

func _ready():
	pass

func _process(delta):
	timeNextShoot -= delta
	
	if Input.is_action_pressed("Shoot") and timeNextShoot <= 0:
		timeNextShoot = SHOOT_MARGIN * delta
		print("shoot")
		
	speed.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	pass

func _physics_process(delta):
	move_and_slide(speed * MAX_SPEED)
	transform.origin.x = clamp(transform.origin.x, 32, 1280-32)
	pass
