extends Spatial

onready var player = Global.Player

onready var level_controls = get_node("Level")
onready var ui_controls = get_node("Message")
onready var current_stage = 1
onready var barge = get_node("Barge")
onready var unload_zone = get_node("Unload")
onready var chain = level_controls.get_node("Chain")

onready var messages = {
						0 : "Ouch! We lost some product! Restock at the harbor, and mind your corners next time!", 
						1 : "To load up cargo from the harbor, grab the barge and get it underneath the crane (the yellow structure by the warehouse).", 
						2 : "Make sure you position the barge straight underneath the crane - don't drop your cargo!",
						3 : "Nice! Load up at least two crates and get them into the marked area.",
						4 : "Allright! Head on to the unloading area. Mind your speed and your cargo - this aint Tokyo Drift.",
						5 : "Now unhook the cable, and let's be on our way.",
						6 : "Congrats! You're now ready for the job - mostly!"
						}

func _ready():
	ui_controls.visible = true
	ui_controls.change_text(messages[1])
	

func _physics_process(_delta):
	match current_stage:
		0:
			if barge.cargo_count() >= 2:
				current_stage = 4
				ui_controls.change_text(messages[4])
		1:
			var chain = level_controls.get_node("Chain")
			if chain.locked:
				current_stage += 1
				ui_controls.change_text(messages[2])
		2:
			if barge.cargo_count() > 0:
				current_stage += 1
				ui_controls.change_text(messages[3])
		3:
			if barge.cargo_count() >= 2:
				current_stage += 1
				ui_controls.change_text(messages[4])
		4:
			if barge.cargo_count() < 2:
				current_stage = 0
				ui_controls.change_text(messages[0])
			if (barge.cargo_count() >= 2) and unload_zone.barge_parked:
				current_stage += 1
				ui_controls.change_text(messages[5])
		5:	
			if (barge.cargo_count() >= 2) and unload_zone.barge_parked:
				if not chain.locked:
					current_stage += 1
					ui_controls.change_text(messages[6])
		6:
			if Input.is_action_just_pressed("ui_accept"):
				get_tree().change_scene("res://interfaces/main_menu_background.tscn")