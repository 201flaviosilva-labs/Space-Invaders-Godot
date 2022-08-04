extends Area2D

export var health = 3
export var speed = 300

func _ready() -> void:
	pass

func _physics_process(delta):
	position.x += speed * delta
	if (position.x >= 1280-32 or position.x <= 32): speed *= -1
	pass

	
func hitted():
	health -= 1
	if (health <= 0): queue_free()
	pass
