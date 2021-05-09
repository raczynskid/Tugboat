extends Generic6DOFJoint

onready var barge_find_area = get_node("barge_locator")
onready var chain_node = get_parent()
onready var locked : bool = false
onready var locked_timer : float = 5
onready var object_attached = null
onready var player = Global.Player
onready var distance_to_attached : float = 0

signal locked_to_barge
signal unlocked_from_barge

func _ready():

	# connect signals
	var chain_root = get_parent().get_parent()
	connect("locked_to_barge", self, "_on_locked_to_barge")
	chain_root.connect("locked_to_barge", self, "_on_locked_to_barge") 
	connect("unlocked_from_barge", self, "_on_unlocked_from_barge")
	chain_root.connect("unlocked_from_barge", self, "_on_unlocked_from_barge") 

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
			emit_signal("locked_to_barge")

func unlock():
	# release the currently pulled object from chain
	locked = false
	emit_signal("unlocked_from_barge")
	locked_timer = 5
	self.set("nodes/node_a", "")
	self.set("nodes/node_b", "")
	object_attached = null
