extends Spatial

onready var player = Global.Player

onready var level_controls = get_node("Level")
onready var ui_controls = get_node("Message")
onready var current_stage = 1
onready var messages = {
						1 : "To load up cargo from the harbor, grab the barge and haul it underneath the crane. Make sure you attach your cable in a good spot for manouvering.", 
						2 : "Make sure you position the barge straight underneath the crane - wouldn't want to drop the cargo in the water!"
						}

func _ready():
	ui_controls.visible = true
	ui_controls.change_text(messages[1])

func _physics_process(_delta):
	match current_stage:
		1:
			var chain = level_controls.get_node("Chain")
			if chain.locked:
				current_stage += 1
				ui_controls.change_text(messages[2])
