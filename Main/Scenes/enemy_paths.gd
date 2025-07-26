extends PathFollow2D

@export var speed = 0.04

@export var Enemy :PackedScene
func _ready() -> void:
	#var En=Enemy.instantiate()
	#add_child(En)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress_ratio += speed * delta
	if progress_ratio>=1.0:
		queue_free()
