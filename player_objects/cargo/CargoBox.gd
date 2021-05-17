extends RigidBody

onready var containter_mesh = get_node("Body")


func _ready():
	randomize()

	var newmaterial = SpatialMaterial.new()
	newmaterial.flags_transparent = true
	newmaterial.albedo_color = Color(randf(), randf(), randf(), 0)
	containter_mesh.material_override = newmaterial

func _physics_process(delta):
	gravity_scale = 0
	containter_mesh.material_override.albedo_color.a += 0.01
	if containter_mesh.material_override.albedo_color.a >= 1:
		gravity_scale = 1
		containter_mesh.material_override.flags_transparent = false
