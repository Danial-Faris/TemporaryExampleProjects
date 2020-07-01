extends Node2D


export(float) var cameraSpeed = 500


onready var camera = $Camera2D

onready var player = $CanvasLayer2/Player
onready var overlay = $CanvasLayer3/Overlay


func _process(delta: float) -> void:
	
	var inputDirection = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()
	
	camera.offset += delta * cameraSpeed * inputDirection
	
	player.global_position = player.get_global_mouse_position()
	
	var playerCanvasPosition = player.get_canvas_transform().xform(player.global_position)
	overlay.global_position = overlay.get_canvas_transform().affine_inverse().xform(playerCanvasPosition)
