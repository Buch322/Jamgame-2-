extends Node2D
@onready var enemy = preload("res://Main/Scenes/enemy_spawn.tscn")
@onready var EnemyPath = preload("res://Main/Scenes/enemy_paths.tscn")
@onready var path_2d: Path2D = $Path2D


func _ready() -> void:
	#add_enemy(100)
	glob.health = 100
	glob.material = 100
	glob.klicks = 30
	glob.klick_income = 1
	
	# диалог, который проигрывается единожды за заход
	if glob.tutorial_played == false:
		Dialogic.start("start_dialogue")
		glob.tutorial_played = true
	else:
		pass


func _process(delta: float) -> void:
	check_health()


# Получение материалов от клика.
func _on_material_click_pressed() -> void:
	if glob.klicks > 0:
		glob.klicks -= 1
		glob.material += glob.klick_income
	else:
		pass


#спавнер первых врагов
func _on_timer_timeout() -> void:
	#print("time")
	var Spawn_Enemy= EnemyPath.instantiate()
	#Spawn_Enemy.Enemy=enemy
	path_2d.add_child(Spawn_Enemy)

# Начало новой волны 
func _on_cycle_timer_timeout() -> void:
	glob.new_cycle()


#проверка на наличие хп иначе просрал
func check_health():
	if glob.health <= 0:
		get_tree().change_scene_to_file("res://Main/Scenes/game_over.tscn")
