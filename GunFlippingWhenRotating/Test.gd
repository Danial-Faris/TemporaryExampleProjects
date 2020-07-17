extends Node2D


onready var gun = $Gun


func _ready() -> void:
	gun.global_position = 0.5 * OS.window_size


func _process(_delta: float) -> void:
	gun.pointAt(get_global_mouse_position())
