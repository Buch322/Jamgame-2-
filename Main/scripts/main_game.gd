extends Node2D
@onready var enemy = preload("res://Main/Scenes/enemy_spawn.tscn")
@onready var EnemyPath = preload("res://Main/Scenes/enemy_paths.tscn")
@onready var EnemyPath2 = preload("res://Main/Scenes/enemy_paths2.tscn")
@onready var EnemyPath3 = preload("res://Main/Scenes/enemy_paths3.tscn")
@onready var path_2d: Path2D = $Path2D


var driller_count = 0
var driller_cost = 60 


func _ready() -> void:
	#add_enemy(100)
	glob.health = 100
	glob.material = 1000
	glob.klicks = 30
	glob.klick_income = 1
	
	# диалог, который проигрывается единожды за заход
	if glob.tutorial_played == false:
		Dialogic.start("dialogic/start_dialogue")
		glob.tutorial_played = true
		Dialogic.timeline_ended.connect(start_wave)
	else:
		pass

func start_wave():
	$timers/WaveTimer1.start()
	$timers/FirstEnemyTimer.start()




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


func _on_click_timer_timeout() -> void:
	glob.klicks+=1


func _on_second_enemy_timer_timeout() -> void:
	var Spawn_Enemy= EnemyPath2.instantiate()
	#Spawn_Enemy.Enemy=enemy
	path_2d.add_child(Spawn_Enemy)



func _on_third_enemy_timer_timeout() -> void:
	var Spawn_Enemy= EnemyPath3.instantiate()
	#Spawn_Enemy.Enemy=enemy
	path_2d.add_child(Spawn_Enemy)


func _on_wave_timer_1_timeout() -> void:
	$timers/WaveTimer2.autostart = true


func _on_wave_timer_2_timeout() -> void:
	$timers/WaveTimer3.autostart = true


func _on_wave_timer_3_timeout() -> void:
	pass # Replace with function body.




func _on_buy_driller_pressed() -> void:
	if glob.material >= driller_cost:
		driller_count += 1
		glob.material -= driller_cost
		driller_cost += 30
		update_driller()

func update_driller():
	$drillers/Driller.visible = (driller_count >= 1)
	$drillers/Driller2.visible = (driller_count >= 2)
	$drillers/Driller3.visible = (driller_count >= 3)
	$drillers/Driller4.visible = (driller_count >= 4)
	$drillers/Driller5.visible = (driller_count >= 5)
	$drillers/Driller6.visible = (driller_count >= 6)
	$drillers/Driller7.visible = (driller_count >= 7)
	$drillers/Driller8.visible = (driller_count >= 8)
	if driller_count == 8:
		$Buy_driller.queue_free()
