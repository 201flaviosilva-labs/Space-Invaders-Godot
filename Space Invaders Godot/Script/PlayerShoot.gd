extends Area2D

export var SPEED: int = 600

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	translate(Vector2.UP * SPEED * delta)
	pass


func _on_PlayerShoot_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Enemy")): 
		area.call_deferred("hitted")
		queue_free()
	pass
