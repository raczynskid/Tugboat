extends Spatial

onready var area_effect = get_node("TargetArea")

func _ready():
	pass # Replace with function body.


func _on_Area_body_entered(body):
	if body.is_in_group("barges"):
		area_effect.to_active()

func _on_Area_body_exited(body):
	if body.is_in_group("barges"):
		area_effect.to_idle()