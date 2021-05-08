extends Generic6DOFJoint

onready var barge_find_area = get_node("barge_locator")
onready var chain_node = get_parent()
onready var locked : bool = false
onready var locked_timer : float = 5
onready var object_attached = null
onready var player = Global.Player
onready var distance_to_attached : float = 0

func _ready():
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and locked:
		unlock()

	if not locked and locked_timer > 0:
		locked_timer -= delta
	
	if locked:
		# check for strain on the link
		# if max distance exceeded, disengage lock
		distance_to_attached = player.translation.distance_to(object_attached.translation)
		if distance_to_attached > 20:
			unlock()



func _on_barge_locator_body_entered(body):
	# detect if chain hook collided with pullable object
	# if collision is detected attach object to chain
	if (not locked) and (locked_timer <= 0):
		if body.is_in_group("barges"):
			self.set("nodes/node_a", body.get_path())
			self.set("nodes/node_b", chain_node.get_path())
			locked = true
			object_attached = body

func unlock():
	# release the currently pulled object from chain
	locked = false
	locked_timer = 5
	self.set("nodes/node_a", "")
	self.set("nodes/node_b", "")
	object_attached = null
