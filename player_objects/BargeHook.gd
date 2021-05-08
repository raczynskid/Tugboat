extends Generic6DOFJoint

onready var barge_find_area = get_node("barge_locator")
onready var chain_node = get_parent()
onready var locked : bool = false
onready var locked_timer : float = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and locked:
		unlock()

	if not locked and locked_timer > 0:
		locked_timer -= delta

func _on_barge_locator_body_entered(body):
	if (not locked) and (locked_timer <= 0):
		if body.is_in_group("barges"):
			self.set("nodes/node_a", body.get_path())
			self.set("nodes/node_b", chain_node.get_path())
			locked = true

func unlock():
	locked = false
	locked_timer = 5
	self.set("nodes/node_a", "")
	self.set("nodes/node_b", "")
