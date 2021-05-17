extends RigidBody

onready var containter_mesh = get_node("Body")


func _ready():
	randomize()

	var newmaterial = SpatialMaterial.new()
	newmaterial.albedo_color = Color(randf(), randf(), randf())
	containter_mesh.material_override = newmaterial
