extends Spatial

onready var player = Global.Player
onready var unload_area = load("res://world_objects/gameplay_objects/unload_area.tscn")
onready var barge = load("res://player_objects/barge/Barge.tscn")
onready var message_ui = get_node("Message")

func _ready():
	pass

func _process(delta):
	pass

func spawn_barge(x,y,z):
	add_child(barge.instance())
	var new_barge = get_node(get_children()[-1].get_path())
	new_barge.translation = Vector3(x,y,z)

func spawn_unload_area(x,y,z):
	add_child(unload_area.instance())
	var new_unload_area = get_node(get_children()[-1].get_path())
	new_unload_area.translation = Vector3(x,y,z)
	
func show_msg(message):
	message_ui.change_text(message)
