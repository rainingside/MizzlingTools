extends CharacterBody2D
class_name Enemy


func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("select"):
		GSignalBus.target_selected.emit(
			TargetSelectedMessage.new(self))
