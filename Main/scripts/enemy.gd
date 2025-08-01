extends CharacterBody2D

@export var speed = 20
@export var health = 35
@export var damage = 1

var burning = false

func burning_check():
	while true:
		await get_tree().create_timer(0.1).timeout
		if burning == true:
			take_damage(5)
			await get_tree().create_timer(0.35).timeout
		else:
			pass

func _ready() -> void:
	burning_check()


func _process(delta: float) -> void:
	update_status()

# получение урона от клика
func _on_button_pressed() -> void:
	if glob.klicks > 0:
		glob.klicks -= 1
		health -= glob.player_damage

# проверка на существование
func update_status():
	if health <= 0:
		queue_free()

# получение урона
func take_damage(taken_damage):
	#print("damage")
	health -= taken_damage
