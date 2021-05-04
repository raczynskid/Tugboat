extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var animationPlayer = get_node("AnimationPlayer")

# Called when the node enters the scene tree for the first time.
func _ready():
	animationPlayer.play("Run")



func _process(delta):
	translate(Vector3(delta*2, 0, 0))
