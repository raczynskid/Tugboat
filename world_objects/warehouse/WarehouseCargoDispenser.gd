extends Spatial
onready var cargo_box = load("res://player_objects/cargo/CargoBox.tscn")
export var drop_delay : int = 100
export var drop_countdown : int = 1

func _ready():
	pass
	#spawn_cargo_box(0,0,0)


func _process(delta):
	if drop_countdown <= 0:
		spawn_cargo_box(1,0,3)
		drop_countdown = drop_delay
	else:
		drop_countdown -= delta
		


func spawn_cargo_box(x,y,z):
	add_child(cargo_box.instance())
	var new_cargo_box = get_node(get_children()[-1].get_path())
	new_cargo_box.translation = Vector3(x,y,z)