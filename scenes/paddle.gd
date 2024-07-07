extends Area2D

const speed = 180
const margin = 60

enum PaddleLocation{
	LEFT,
	RIGHT
}

@export var paddle_location = PaddleLocation.LEFT

var input_name = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	if paddle_location == PaddleLocation.LEFT:
		input_name = "left_"
	if paddle_location == PaddleLocation.RIGHT:
		input_name = "right_"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if Input.is_action_pressed(input_name + "move_up"):
		global_position.y += -speed * delta
	if Input.is_action_pressed(input_name + "move_down"):
		global_position.y += speed * delta
	global_position.y = clamp(global_position.y,margin,576-margin)
