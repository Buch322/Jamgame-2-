extends Node2D

@onready var enemy = preload("res://Main/Scenes/enemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#add_enemy(100)
	glob.health = 100
	glob.material = 30
	glob.klicks = 30
	glob.klick_income = 1
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_material_click_pressed() -> void:
	if glob.klicks > 0:
		glob.klicks -= 1
		glob.material += glob.klick_income
	else:
		pass
