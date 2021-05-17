extends Spatial
onready var cargo_box = load("res://player_objects/cargo/CargoBox.tscn")
export var drop_delay : int = 100
export var drop_countdown : int = 1

onready var barge_parked : bool = false

func _ready():
	pass

func _process(delta):
	if barge_parked:
		if drop_countdown <= 0:
			spawn_cargo_box(1,0,5)
			drop_countdown = drop_delay
		else:
			drop_countdown -= delta
	else:
		drop_countdown = drop_delay
		
func _on_Area_body_entered(body):
	if body.is_in_group("barges"):
		barge_parked = true

func _on_Area_body_exited(body):
	if body.is_in_group("barges"):
		barge_parked = false

func spawn_cargo_box(x,y,z):
	add_child(cargo_box.instance())
	var new_cargo_box = get_node(get_children()[-1].get_path())
	new_cargo_box.translation = Vector3(x,y,z)