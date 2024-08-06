extends Control

func _on_play_against_player_pressed():
	Global.set_status(false)
	Global.second_player_win_lb = "Player 2 Wins!"
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_play_against_computer_pressed():
	Global.set_status(true)
	Global.second_player_win_lb = "Computer Wins!"
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_quit_pressed():
	get_tree().quit()
