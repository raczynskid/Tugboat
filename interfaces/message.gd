extends Control

export var text_to_display : String = ""
onready var text_displayed = get_node("MarginContainer/ColorRect/MarginContainer/RichTextLabel")
onready var charlist : Array = []

func _ready():
	for c in text_to_display:
		charlist.append(c)
	text_displayed.text = ""

func _process(delta):
	if text_to_display != text_displayed.text:
		var add_character = charlist.pop_front()
		if add_character != null:
			text_displayed.text += add_character
