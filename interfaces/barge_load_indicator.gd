# collection of 3d objects displayed in relation to main camera
# contains UI for the number of cargo loaded on all barges
# updated from LevelTemplate node

extends Spatial

onready var crate_icon = load("res://interfaces/gauges/cargo_gauge.tscn")
onready var horizontal_offset = 0
onready var for_deletion = null
onready var for_deletion_queue = []

func increase_bar():
	# entry point, add one crate icon
	spawn_icon(horizontal_offset, 0, 0)
	horizontal_offset += 0.6

func decrease_bar():
	# entry point, remove one crate icon
	# adds last created crate to deletion queue
	# deletion queue is later handled in physics process
	# to allow for the entire animation to play out
	var i = 1
	for_deletion = get_children()[-i]
	while for_deletion in for_deletion_queue:
		i += 1
		for_deletion = get_children()[-i]
	for_deletion_queue.append(for_deletion)
		
func spawn_icon(x,y,z):
	add_child(crate_icon.instance())
	var new_crate_icon = get_node(get_children()[-1].get_path())
	new_crate_icon.translation = Vector3(x,y,z)

func _physics_process(_delta):
	if for_deletion_queue != []:
		for obj in for_deletion_queue:
			if obj.translation.x < 10:
				obj.translation.x += 0.1
			else:
				horizontal_offset -= 0.6
				for_deletion_queue.erase(obj)
				obj.queue_free()
