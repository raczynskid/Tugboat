extends Spatial

onready var welcome_text = "2 cargo to pass"

onready var player = Global.Player

onready var level_controls = get_node("Level")
onready var barge = get_node("Barge")
onready var unload_zone = get_node("Unload")
onready var chain = level_controls.get_node("Chain")

var completed : bool = false
var cargo_to_pass : int = 2
var expected_time : float = 180

func _physics_process(delta):
    if (barge.cargo_count() >= cargo_to_pass) and unload_zone.barge_parked:
        if (not chain.locked) and (not completed):
            complete_level()

func complete_level():
    completed = true
    var score = count_score()
    print("level completed with " + str(score) + " points")

func count_score():
    var extra_cargo_score = (barge.cargo_count() - cargo_to_pass) * 10
    var time_bonus = (expected_time - level_controls.time_elapsed) * 10
    if time_bonus < 0:
        time_bonus = 0
    var total_score = round(extra_cargo_score + time_bonus)
    return total_score