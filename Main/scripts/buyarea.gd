extends Node2D
#турели
@onready var turret1 = preload("res://Main/Scenes/centry.tscn") #базовая
@onready var turret2 = preload("res://Main/Scenes/fireshooter_centry.tscn") # ракетная
@onready var turret3 = preload("res://Main/Scenes/sniper_centry.tscn") #снайперская

@export var Based_turret_cost = 45
@export var rocket_turret_cost = 90
@export var Sniper_turret_cost = 120

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# появление менюшки
func _on_buy_centry_pressed() -> void:
	$BuyCentry.visible = false
	$Panel.visible = true

# убрать менюшку
func _on_otmena_pressed() -> void:
	$BuyCentry.visible = true
	$Panel.visible = false


# меню закупа
func _on_buy_centry_1_pressed() -> void:
	var turret1 = turret1.instantiate()
	if glob.material >= Based_turret_cost:
		$".".add_child(turret1)
		glob.material -= Based_turret_cost
		$Panel.visible = false


func _on_buy_centry_2_pressed() -> void:
	var turret2 = turret2.instantiate()
	if glob.material >= rocket_turret_cost:
		$".".add_child(turret2)
		glob.material -= rocket_turret_cost
		$Panel.visible = false


func _on_buy_centry_3_pressed() -> void:
	var turret3 = turret3.instantiate()
	if glob.material >= Sniper_turret_cost:
		$".".add_child(turret3)
		glob.material -= Sniper_turret_cost
		$Panel.visible = false
