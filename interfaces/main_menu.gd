extends Control

func _ready():
	pass

func _process(delta):
	pass

func _on_NewGame_button_up():
	return get_tree().change_scene("res://levels/LevelTemplate.tscn")