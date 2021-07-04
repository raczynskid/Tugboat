extends Control


func _on_Restart_button_up():
	return get_parent().get_tree().reload_current_scene()