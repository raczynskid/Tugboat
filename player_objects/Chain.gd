extends Spatial

var locked : bool = false

func _ready():
	pass # Replace with function body.


func _process(_delta):
	pass

func _on_BargeHook_locked_to_barge():
	locked = true

func _on_BargeHook_unlocked_from_barge():
	locked = false