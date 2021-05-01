extends Spatial

export var raised : bool = false

onready var wing_L = get_node("bridge_wingL")
onready var wing_R = get_node("bridge_wingR")
onready var open_area = get_node("open_area")
onready var player = Global.Player

func _process(_delta):
	for wing in [wing_L, wing_R]:
		if raised and round(rad2deg(wing.pivot_point.rotation.z)) >= -45:
			wing.pivot_point.rotate_z(deg2rad(-1))
		else:
			if (rad2deg(wing.pivot_point.rotation.z) < 0) and (not raised):
				wing.pivot_point.rotate_z(deg2rad(1))


func _on_open_area_body_entered(body):
	if body == player:
		raised = true


func _on_open_area_body_exited(body):
	if body == player:
		raised = false
