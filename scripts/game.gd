extends Node2D

var Ball = preload("res://scenes/ball.tscn")


@onready var ballContainer = $BallContainer
@onready var ballSpawnLocation = $BallContainer/BallSpawnLocation
@onready var reset_timer = $ResetTimer
@onready var score_label = $Graphics/Score
@onready var r_paddle = $PaddleContainer/Paddle2

const win_number = 6
var score = Vector2(0,0)

func _ready():
	reset_ball()
	print(Global.playing_AI)
	if Global.playing_AI:
		r_paddle.is_AI = true
	else:
		r_paddle.is_AI = false

func _on_ball_out(wall_name):
	match wall_name:
		"LeftWall":
			score.y += 1
		"RightWall":
			score.x += 1
	update_score()
	if score.x >= win_number || score.y >= win_number:
		game_over()
	reset_timer.start() 

func reset_ball():
	var ball = Ball.instantiate()
	ballContainer.add_child(ball)
	ball.global_position = ballSpawnLocation.global_position

func update_score():
	score_label.text = str(score.x) + "-" + str(score.y)

func game_over():
	get_tree().reload_current_scene()
