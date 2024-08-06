extends Node2D

var Ball = preload("res://scenes/ball.tscn")


@onready var ballContainer = $BallContainer
@onready var ballSpawnLocation = $BallContainer/BallSpawnLocation
@onready var reset_timer = $ResetTimer
@onready var score_label = $Graphics/Score
@onready var l_paddle = $PaddleContainer/Paddle
@onready var r_paddle = $PaddleContainer/Paddle2
@onready var countdown = $CountdownContainer/Countdown
@onready var countdown_label = $CountdownContainer/CountdownLabel
@onready var winner_label = $GameOverContainer/VBoxContainer/WinnerText
@onready var gameover_cont = $GameOverContainer/VBoxContainer

const win_number = 1
var score = Vector2(0,0)
var countdown_sec = 3
var game_active = false 

func _ready():
	gameover_cont.visible = false
	gameover_cont.process_mode = Node.PROCESS_MODE_ALWAYS
	start_countdown()
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
	freeze_game()
	display_winner()
	gameover_cont.visible = true
	#get_tree().reload_current_scene()

func start_countdown():
	game_active = false
	freeze_game()
	countdown_label.text = str(countdown_sec)
	countdown_label.show()
	countdown.start()


func _on_countdown_timeout():
	countdown_sec -= 1
	if(countdown_sec > 0):
		countdown_label.text = str(countdown_sec)
	elif countdown_sec == 0:
		countdown_label.text = "Ready, GO!"
	else:
		countdown_label.hide()
		countdown.stop()
		unfreeze_game()
		reset_ball()
		game_active = true

func freeze_game():
	get_tree().paused = true
func unfreeze_game():
	get_tree().paused = false

func display_winner():
	var winner = "Player 1 Wins!" if score.x >= win_number else Global.second_player_win_lb
	winner_label.text = winner


func _on_play_again_pressed():
	get_tree().reload_current_scene()


func _on_go_back_to_menu_pressed():
	unfreeze_game()
	get_tree().change_scene_to_file("res://scenes/game_menu.tscn")
