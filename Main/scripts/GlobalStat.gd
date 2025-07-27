extends Node

#не самая важная хрень
var Localisation = 1
var tutorial_played = true

# основные штуки
var material = 0
var health = 100
var klicks = 30

# статистики клика
var klick_income = 1
var player_damage = 15


var stage = 0


func new_cycle():
	stage += 1
	klicks += 12
	player_damage += 1
