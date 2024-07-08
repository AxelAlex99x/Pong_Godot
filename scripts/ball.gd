extends Area2D

var speed = 200
var direction = Vector2.LEFT
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _physics_process(delta):
	speed += delta * 2
	global_position += speed * direction * delta
	#print(speed)
