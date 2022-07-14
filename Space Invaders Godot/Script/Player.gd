extends KinematicBody2D

# Shoot Prefab
var SHOOT: PackedScene = load("res://Prefabs/PlayerShoot.tscn")

# Getting Nodes
onready var current_scene = get_tree().current_scene 
onready var GUN_LEFT = $GunLeft
onready var GUN_RIGHT = $GunRight

# Shoot
var timeNextShoot = 0
const SHOOT_MARGIN = 15
var isLeftNextShoot = true

# Move
const MAX_SPEED = 100
var speed = Vector2(0,0)

func _ready():
	pass

func _process(delta):
	# Shoot
	timeNextShoot -= delta
	if Input.is_action_pressed("Shoot") and timeNextShoot <= 0: _shoot(delta)
	
	# Move
	speed.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	pass
	
func _shoot(delta: float):
	timeNextShoot = SHOOT_MARGIN * delta
	isLeftNextShoot = not isLeftNextShoot
	
	var current_gun_position
	if isLeftNextShoot: current_gun_position = GUN_LEFT.global_position
	else: current_gun_position = GUN_RIGHT.global_position
	
	var new_shoot = SHOOT.instance()
	current_scene.add_child(new_shoot)
	new_shoot.global_position = current_gun_position
	
	print(current_gun_position)

func _physics_process(delta):
	move_and_slide(speed * MAX_SPEED)
	transform.origin.x = clamp(transform.origin.x, 32, 1280-32)
	pass
