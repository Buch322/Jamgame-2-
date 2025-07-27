extends Node2D

var build_progress = 0
var max_bluildd_progres = 50
var cost = 20

#столкновение с объектом
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		glob.health -= body.damage
		$AudioStreamPlayer2D.play()
		body.queue_free()

# Прогрессия починкиы
func _on_button_pressed() -> void:
	if  glob.material >= cost and glob.klicks > 0:
		build_progress += 1
		glob.material -= cost
		glob.klicks -= 1
		cost += 7
		check()

func check():
	if build_progress == 50:
		get_tree().change_scene_to_file("res://Main/Scenes/you_win.tscn")
