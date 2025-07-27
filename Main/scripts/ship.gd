extends Node2D

var build_progress = 0
@export var max_bluildd_progres = 20
@export var cost = 10

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
		cost += 5
		check()

func check():
	$"labels and buttons/FixLabel".text="Процент починки корабля="+str(build_progress*5)
	if build_progress == max_bluildd_progres:
		get_tree().change_scene_to_file("res://Main/Scenes/you_win.tscn")
