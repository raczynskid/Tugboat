extends Node

onready var ship_img = get_node("Ship_message/Ship_pic")
onready var msg = get_node("Ship_message/msg")
onready var bar = get_node("bar")
onready var text = get_node("Ship_message/msg/RichTextLabel")
onready var ship_msg = get_node("Ship_message")
onready var gone : bool = false


func _ready():
	var level_name = get_tree().get_current_scene().name
	var welcome_messages = {"Level1" : "deliver 2 cargo to pass",
						"Tutorial" : "Movement tutorial",
						"EnvironmentTutorial" : "deliver 2 cargo to pass"}
	text.text = welcome_messages[level_name]

func move():
	ship_img.position.x += 10
	msg.position.x += 7

func disappear():
	bar.modulate.a -= 0.005

func _physics_process(delta):
	if ship_img.position.x < 1200:
		move()
	if ship_img.position.x > 1000:
		disappear()
	
	if bar.modulate.a < 0:
		queue_free()
