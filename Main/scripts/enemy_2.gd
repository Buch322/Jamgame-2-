extends CharacterBody2D

@export var speed = 12
@export var health = 50
@export var damage = 3


func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	update_status()

# получение урона от клика
func _on_button_pressed() -> void:
	if glob.klicks > 0:
		glob.klicks -= 1
		health -= glob.player_damage

# проверка на существоване
func update_status():
	if health <= 0:
		queue_free()

# получение урона
func take_damage(taken_damage):
	print("damage")
	health -= taken_damage
