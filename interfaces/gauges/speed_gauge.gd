extends Spatial

onready var body = get_node("engine_signal_body")
onready var handle = get_node("engine_signal_handle")
onready var player = get_tree().get_current_scene().get_node("Level").get_node_or_null("Player")

func _physics_process(_delta):
	var player_speed = player.current_speed
	rotation_degrees.y = player.current_speed * -2
	if player_speed > 0:
		handle.rotation_degrees.z = 47.821 + (player.current_speed * 21)
	else:
		handle.rotation_degrees.z = 47.821 + (player.current_speed * 29.6)
