extends Camera

onready var distance_from_player : Vector3
onready var player = get_parent().get_parent().get_node("Player")

func _ready():	
	distance_from_player = player.get_translation() - translation

func _process(delta):
	transform.origin = player.transform.origin - distance_from_player
