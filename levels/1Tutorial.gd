extends Spatial

onready var player = Global.Player

onready var level_controls = get_node("Level")
onready var ui_controls = get_node("Message")
onready var current_stage = 1
onready var messages = {
						1 : "Hey there Captain! Welcome to Tugboat!", 
						2 : "To set your speed, use up and down. Steer with left and right arrows.",
						3 : "Great job! Now set sail to the designated area.",
						4 : "Amazing! The goal of the game is to deliver cargo to points like these. Push the barge into the new target area!",
						5 : "You can also use your tow cable to pull barges into position. Touch the barge with the tow cable to automatically attach.",
						6 : "Now pull the barge into the next target area and press SPACE to disconnect.",
						7 : "Great job! You know the basics - now get to the harbour and get on hauling!"
						}

onready var up_pressed = false
onready var down_pressed = false
onready var right_pressed = false
onready var left_pressed = false

onready var start_area_visited = false

func _ready():
	ui_controls.visible = true
	ui_controls.change_text(messages[1])

func _physics_process(_delta):
	match current_stage:
		1:
			if Input.is_action_just_pressed("ui_accept"):
				current_stage += 1
				ui_controls.change_text(messages[2])
		2:

			if Input.is_action_pressed("ui_up"):
				up_pressed = true
			if Input.is_action_pressed("ui_down"):
				down_pressed = true
			if Input.is_action_pressed("ui_left"):
				left_pressed = true
			if Input.is_action_pressed("ui_right"):
				right_pressed = true

			if up_pressed and down_pressed and right_pressed and left_pressed:
				current_stage += 1
				ui_controls.change_text(messages[3])
				level_controls.spawn_unload_area(20, 4, 30)
		3:
			var unload_area = level_controls.get_node("Unload")
			if player in unload_area.get_node("Area").get_overlapping_bodies():
				unload_area.area_effect.to_active()
				current_stage += 1
				ui_controls.change_text(messages[4])
				level_controls.spawn_barge(0, 20, 0)
		4:
			var unload_area = level_controls.get_node("Unload")
			if not player in unload_area.get_node("Area").get_overlapping_bodies():
				unload_area.queue_free()
				current_stage += 1
				level_controls.spawn_unload_area(0, 4, -20)
		5:
			var unload_area = level_controls.get_node("@Unload@4")
			if unload_area.barge_parked:
				current_stage += 1
				ui_controls.change_text(messages[5])
		6:
			var unload_area = level_controls.get_node("@Unload@4")
			var chain = level_controls.get_node("Chain")
			if chain.locked:
				current_stage += 1
				ui_controls.change_text(messages[6])
				unload_area.queue_free()
				level_controls.spawn_unload_area(20, 4, -30)
		7:
			var unload_area = level_controls.get_node("Unload")
			var chain = level_controls.get_node("Chain")

			if unload_area.barge_parked and not chain.locked:
				current_stage += 1
				ui_controls.change_text(messages[7])
		8:
			if Input.is_action_just_pressed("ui_accept"):
				get_tree().change_scene("res://levels/2Tutorial.tscn")
		
