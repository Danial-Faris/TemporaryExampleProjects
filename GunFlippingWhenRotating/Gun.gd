extends Node2D


onready var gfx: Node2D = $Graphics


func pointAt(targetGlobal: Vector2) -> void:
	gfx.look_at(targetGlobal)
	var flipX = targetGlobal.x < gfx.global_position.x
	gfx.scale.y = -1 if flipX else 1 
