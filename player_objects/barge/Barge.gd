extends RigidBody
onready var content_detector = get_node("content_detector")
onready var contents = []
onready var level = get_parent().get_node("Level")


func _on_content_detector_body_entered(body):
	if body.is_in_group("cargo"):
		contents.append(body)
		level.increase_cargo_counter()

func _on_content_detector_body_exited(body):
	if body in contents:
		contents.erase(body)
		level.decrease_cargo_counter()

func cargo_count():
	return len(contents)