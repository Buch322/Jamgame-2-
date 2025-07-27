extends Node2D


func _on_button_2_pressed() -> void:
	glob.Localisation += 1
	if glob.Localisation >2:
		glob.Localisation = 1


func _on_button_3_pressed() -> void:
	get_tree().quit()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Main/Scenes/main_game.tscn")
