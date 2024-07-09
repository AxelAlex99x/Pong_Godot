extends Control

func _on_play_against_player_pressed():
	Global.set_status(false)
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_play_against_computer_pressed():
	Global.set_status(true)
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_quit_pressed():
	get_tree().quit()
