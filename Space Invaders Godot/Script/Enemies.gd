extends Node2D

export var speed = Vector2(300, 0)

func _physics_process(delta):
	for row in $"Enemies Rows".get_children():
		row.position += speed * delta
		pass
	speed.y = 0
	pass

# Collision Functions
func _on_Left_area_entered(area: Area2D) -> void:
	speed.x = abs(speed.x)
	speed.y += 250
	pass # Replace with function body.
	
	
func _on_Right_area_entered(area: Area2D) -> void:
	speed.x = -abs(speed.x)
	speed.y += 250
	pass # Replace with function body.
