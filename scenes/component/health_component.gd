extends Node
class_name HealthComponent

signal died

@export var max_health: float = 10
var current_health

func _ready():
	current_health = max_health

func damage(damage_val: float):
	current_health = max(current_health - damage_val, 0)
	Callable(check_death).call_deferred() #Fixes Error(calls check_death on the next idil frame)

func check_death():
	if current_health == 0:
		died.emit()
		owner.queue_free()
