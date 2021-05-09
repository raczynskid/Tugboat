extends Spatial


onready var node_particles = get_node("Particles").get_children()
onready var alpha : float = 0.486275
export(Color, RGB) var idle_color = Color(0.964706,0.823529,0)
export(Color, RGB) var active_color = Color(1,1,1)
export(Color, RGB) var alt_color = Color(1,1,1)


func _ready():
	change_color(idle_color)


func change_color(color):
	for emitter in node_particles:
		print(emitter.draw_pass_1.material.albedo_color)
		emitter.draw_pass_1.material.albedo_color = color

func to_active():
	change_color(active_color)

func to_idle():
	change_color(idle_color)

func to_alt():
	change_color(alt_color)
