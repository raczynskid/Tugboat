extends KinematicBody

export var gravity = 0
export var max_speed : float = 10
export var acceleration : float = 0.05
export var deceleration : float = 0.03
export var rot_speed : float = 0.6

var velocity = Vector3.ZERO
var current_speed : float = 0

func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	get_input(delta)
	velocity = move_and_slide(velocity, Vector3.UP)

func get_input(delta):
	velocity = Vector3.ZERO
	if Input.is_action_pressed("ui_up"):
		current_speed = lerp(current_speed, max_speed, acceleration)
	elif Input.is_action_pressed("ui_down"):
		current_speed = clamp(current_speed - acceleration, -(0.7 * max_speed), max_speed)
	else:
		current_speed = lerp(current_speed, 0, deceleration)

	if Input.is_action_pressed("ui_right"):
		print(rot_speed * delta)
		rotate_y((-rot_speed * delta) * (current_speed/3))
	if Input.is_action_pressed("ui_left"):
		rotate_y((rot_speed * delta) * (current_speed/3))
		
	velocity += -transform.basis.z * current_speed

func clamp_vector(vector : Vector3, min_val, max_val):
	vector.x = clamp(vector.x, min_val, max_val)
	vector.y = clamp(vector.y, min_val, max_val)
	vector.z = clamp(vector.z, min_val, max_val)
	return vector
	
