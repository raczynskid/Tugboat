extends Node

onready var ship_img = get_node("Ship_message/Ship_pic")
onready var msg = get_node("Ship_message/msg")
onready var bar = get_node("bar")
onready var gone : bool = false

func move():
	ship_img.position.x += 10
	msg.position.x += 8

func disappear():
	bar.modulate.a -= 0.03

func _physics_process(delta):
	if ship_img.position.x < 1200:
		move()
	if ship_img.position.x > 1000:
		disappear()
	
	if bar.modulate.a < 0:
		queue_free()
