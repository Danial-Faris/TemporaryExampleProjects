extends RigidBody2D

export var maxTurningSpeed: float = 180 # angle in degrees per second
export var recoilMagnitude: float = 50 # to tweak

export var debugDraw = true

var target_position: Vector2
var current_direction: Vector2
var to_target_direction: Vector2
var rotation_angle: float

var should_recoil: bool = false

func _process(delta: float):
	if Input.is_action_just_pressed('LMB'):
		should_recoil = true
	update()

func _physics_process(delta: float):
	target_position = get_global_mouse_position()
	current_direction = get_global_transform().basis_xform(Vector2.RIGHT).normalized()
	to_target_direction = (target_position - global_position).normalized()
	rotation_angle = current_direction.angle_to(to_target_direction)
	
	if abs(rotation_angle) >= delta * deg2rad(maxTurningSpeed):
		angular_velocity = sign(rotation_angle) * deg2rad(maxTurningSpeed)
	else:
		angular_velocity = rotation_angle / delta
	
	if should_recoil:
		apply_central_impulse(Vector2(-recoilMagnitude, 0).rotated(global_rotation))
		should_recoil = false


var debug_direction_vectors_magnitude: float = 64
var debug_direction_vectors_width: float = 2
func _draw():
	if !debugDraw:
		return
	draw_line(Vector2.ZERO, debug_direction_vectors_magnitude * Vector2.RIGHT, Color.blue, debug_direction_vectors_width, true)
	draw_line(Vector2.ZERO, debug_direction_vectors_magnitude * Vector2.RIGHT.rotated(rotation_angle), Color.red, debug_direction_vectors_width, true)
	draw_line(Vector2.ZERO, get_global_transform().basis_xform_inv(linear_velocity), Color.yellow, debug_direction_vectors_width, true)
	
