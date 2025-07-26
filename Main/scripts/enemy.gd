extends CharacterBody2D
@export var speed = 20
@export var health = 35
@export var damage = 1
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_status()


func _on_button_pressed() -> void:
	if glob.klicks > 0:
		glob.klicks -= 1
		health -= glob.player_damage


func update_status():
	if health <= 0:
		queue_free()

func take_damage(taken_damage):
	health -= taken_damage
