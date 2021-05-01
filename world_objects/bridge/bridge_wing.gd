extends Spatial


export var raised_degs = 0
onready var pivot_point = get_node("pivot")

func _ready():
	pivot_point.rotate_z(deg2rad(raised_degs))

