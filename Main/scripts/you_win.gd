extends Node2D


func _ready() -> void:
	Dialogic.start("win")

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Main/Scenes/menu.tscn")
