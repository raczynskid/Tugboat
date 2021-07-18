extends Control


func _on_Restart_button_up():
	return get_parent().get_tree().reload_current_scene()

func _on_Exit_button_up():
	return get_tree().change_scene("res://interfaces/main_menu_background.tscn")