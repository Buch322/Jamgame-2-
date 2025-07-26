extends Node2D
var target
var builded = false
var ammo = 15
var reload = 0
@export var damage = 15
@export var cooldown = 6
@export var cost = 45

func _ready() -> void:
	pass



func _process(delta: float) -> void:
	pass

# Кнопка покупки(скоро изменю чуть систему покупки)
func _on_buy_centry_pressed() -> void:
	if glob.material >= cost:
		$buyarea.visible = false
		$centry1.visible = true
		$centry1/Area2D/CollisionShape2D.disabled = false
		glob.material -= cost
		builded = true

# Выстрел
func shoot():
	if target != null:
		if target.has_method("take_damage"):
			target.take_damage(damage)
			reload += cooldown
			ammo -= 1
			#print("damage dealed")
	#else:
		#print("000")

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
	if target != null and builded == true:
		shoot()
