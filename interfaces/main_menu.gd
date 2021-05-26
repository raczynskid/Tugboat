extends Control

func _on_NewGame_button_up():
	pass

func _on_Tutorial_button_up():
	return get_tree().change_scene("res://levels/1Tutorial.tscn")