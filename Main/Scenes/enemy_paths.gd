extends PathFollow2D

@export var speed = 0.04

@export var Enemy :PackedScene


func _ready() -> void:
	#var En=Enemy.instantiate()
	#add_child(En)
	pass


func _process(delta: float) -> void:
	progress_ratio += speed * delta
	
