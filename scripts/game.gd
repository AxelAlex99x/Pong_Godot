extends Node2D

var Ball = preload("res://scenes/ball.tscn")

@onready var ballContainer = $BallContainer
@onready var ballSpawnLocation = $BallContainer/BallSpawnLocation
# Called when the node enters the scene tree for the first time.
func _ready():
	var ball = Ball.instantiate()
	ballContainer.add_child(ball)
	ball.global_position = ballSpawnLocation.global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ball_out(wall_name):
	pass # Replace with function body.
