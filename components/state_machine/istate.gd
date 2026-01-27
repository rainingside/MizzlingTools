extends Node
class_name IState

@warning_ignore("unused_signal")
signal Transitioned(state:IState, new_state_name:String)

func enter() -> void:
	pass

func exit() -> void:
	pass

func update(_delta:float) -> void:
	pass

func physics_update(_delta:float) -> void:
	pass
