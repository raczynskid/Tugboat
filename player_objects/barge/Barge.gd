extends RigidBody
onready var content_detector = get_node("content_detector")
onready var contents = []
onready var level = get_parent().get_node("Level")


func _on_content_detector_body_entered(body):
	if body.is_in_group("cargo"):
		contents.append(body)
		print("cargo_gained")
		level.increase_cargo_counter()
	print(len(contents))

func _on_content_detector_body_exited(body):
	if body in contents:
		contents.erase(body)
		print("cargo_lost")
		level.decrease_cargo_counter()
	print(len(contents))
