extends Node2D
var target

var ammo = 15
var reload = 0
@export var damage = 15
@export var cooldown = 6

func _ready() -> void:
	reload_time()

# Выстрел
func shoot():
	if target != null:
		if target.has_method("take_damage") and reload <= 0:
			$AudioStreamPlayer2D.play()
			target.take_damage(damage)
			reload = cooldown
			ammo -= 1


func reload_time():
	while true:
		await get_tree().create_timer(0.1).timeout
		reload -= 1


# Тело вошло
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage") and target == null:
		#body.take_damage(5)
		target = body
		print("i choosed the target!")

# Тело вышло
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == target:
		target = null
		print("target lost")

# Таймер после которого идет выстрел
func _on_timer_timeout() -> void:
	if target != null:
		shoot()
