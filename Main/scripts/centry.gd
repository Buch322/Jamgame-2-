extends Node2D
var target
var builded = false
var ammo = 15
var reload = 0
@export var damage = 20
@export var cooldown = 0.4
@export var cost = 45

func _ready() -> void:
	reload_time()



func _process(delta: float) -> void:
	if builded == true:
		shoot()

func _on_buy_centry_pressed() -> void:
	if glob.material >= cost:
		$buyarea.visible = false
		$centry1.visible = true
		glob.material -= cost
		builded = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "enemy" and target == null:
		target = body
		print("i choosed the target!")

func shoot():
	if target == CharacterBody2D:
		if target.is_in_group("Enemy") and reload == 0:
			target.take_damage(damage)
			reload += cooldown
			ammo -= 1
			print("damage dealed")
	else:
		print("000")

func reload_time():
	while true:
		await get_tree().create_timer(0.1).timeout
		reload -= 0.1


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == target:
		target = null
		print("target lost")
