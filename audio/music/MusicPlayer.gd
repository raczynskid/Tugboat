extends Node

export(AudioStreamMP3) var audio_file
onready var stream = get_node("AudioStreamPlayer")


func _ready():
	pass

func reload_volume():
	stream.set_volume_db(linear2db(Global.Music_volume))
