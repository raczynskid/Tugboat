extends StaticBody

export var speed : float = 1
export var rotation_speed : float = 1

var rot_dir : int = 0

func _ready():
	randomize()
	var random_seed = randf()
	if random_seed > 0.5:
		rot_dir = 1
	else:
		rot_dir = -1
	print(random_seed)

func _process(delta):
	rotate(Vector3(0,1,0), (rotation_speed * 0.1 * rot_dir) * delta)
	
