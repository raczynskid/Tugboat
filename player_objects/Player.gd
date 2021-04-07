extends KinematicBody

export var gravity = 0
export var speed = 4
export var rot_speed = 0.85

var velocity = Vector3.ZERO

func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	get_input(delta)
	velocity = move_and_slide(velocity, Vector3.UP)


func get_input(delta):
	var vy = velocity.y
	velocity = Vector3.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity += -transform.basis.z * speed
	if Input.is_action_pressed("ui_down"):
		velocity += transform.basis.z * speed
	if Input.is_action_pressed("ui_right"):
		rotate_y(-rot_speed * delta)
	if Input.is_action_pressed("ui_left"):
		rotate_y(rot_speed * delta)
	velocity.y = vy
