extends Resource
class_name Attribute

signal health_changed(health: int)

@export var Health: int = 100:
	set(value):
		if value == Health:
			return
		Health = value
		health_changed.emit(value)
@export var MaxHealth: int = 100


	
