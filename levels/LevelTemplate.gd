extends Spatial

onready var player = Global.Player
onready var unload_area = load("res://world_objects/gameplay_objects/unload_area.tscn")
onready var barge = load("res://player_objects/barge/Barge.tscn")
onready var message_ui = get_node("Message")
onready var cargo_counter = get_node("cameras/main_camera/indicator")
onready var pause_menu = get_node("CanvasLayer/CenterContainer/pause_menu")
onready var volume_slider = get_node("CanvasLayer/volume_slider")
onready var timer = get_node("cameras/main_camera/Timer")

onready var vehicle_paths = get_parent().get_node_or_null("VehiclesMisc")

var time_elapsed = 0
var crates_completed = 0

func _ready():
	pass

func _process(delta):
	move_vehicles(delta)
	if Input.is_action_just_pressed("ui_cancel"):
		toggle_pause_menu()
	time_elapsed = timer.elapsed

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

func increase_cargo_counter():
	cargo_counter.increase_bar()

func decrease_cargo_counter():
	cargo_counter.decrease_bar()

func move_vehicles(delta):
	if vehicle_paths != null:
		for vehicle_path in vehicle_paths.get_children():
			var follow = vehicle_path.get_node("PathFollow")
			var vehicle = follow.get_children()[0]
			follow.offset += delta * vehicle.speed

func toggle_pause_menu():
		if pause_menu.visible:
			pause_menu.visible = false
			volume_slider.visible = false
		else:
			pause_menu.visible = true
			volume_slider.visible = true


func _on_volume_slider_value_changed(value):
	Global.Music_volume = value
	reload_music_volume()

func reload_music_volume():
	var music_player = get_parent().get_node("MusicPlayer")
	music_player.reload_volume()

