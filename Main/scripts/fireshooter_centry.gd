extends Node2D

var targets = 0

var ammo = 15
var reload = 0



@export var damage = 15
@export var cooldown = 6

func _ready() -> void:
	reload_time()


func _process(delta: float) -> void:
	if targets == 0:
		$fire/CollisionShape2D.disabled = true

# Выстрел
func shoot():
	$fire/CollisionShape2D.disabled = false

func reload_time():
	while true:
		await get_tree().create_timer(0.1).timeout
		reload -= 1


# Тело вошло
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		targets += 1

# Тело вышло
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.has_method("take_damage"):
		targets -= 1
		print("target lost")

# Таймер после которого идет выстрел
func _on_timer_timeout() -> void:
	if targets > 0:
		shoot()

func _on_fire_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.burning = true

func _on_fire_body_exited(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.burning = false
