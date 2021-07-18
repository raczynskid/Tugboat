extends HSlider

onready var global_volume = Global.Music_volume

func _ready():
	value = global_volume
