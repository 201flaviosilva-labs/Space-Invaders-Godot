extends Area2D

export var health = 3
export var TEXTURE = preload("res://Assets/Sprites/Aliens/Tank.png")

func _ready() -> void:
	$Sprite.texture = TEXTURE
	pass
	
func hitted():
	health -= 1
	if (health <= 0): queue_free()
	pass
