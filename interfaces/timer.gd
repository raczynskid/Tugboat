extends Control

onready var counter = get_node("RichTextLabel")
onready var elapsed = 0

func _ready():
	pass

func _physics_process(delta):
	elapsed += delta
	counter.text = to_time(elapsed)

func to_time(seconds):
	var m = floor(seconds/60)
	var s = seconds - (m*60)
	return str(m) + " : " + str(floor(s))
