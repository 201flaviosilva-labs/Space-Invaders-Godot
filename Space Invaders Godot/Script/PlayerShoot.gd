extends Area2D

export var SPEED: int = 600

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	translate(Vector2.UP * SPEED * delta)
	pass
