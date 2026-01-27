extends Node
class_name StateMachine

@export var InitState:IState

var CurrentState:IState
var LastState:IState
var States:Dictionary = {}

func _ready() -> void:
	for child in get_children():
		if child is IState:
			States[child.to_string()] = child
			child.Transitioned.connect(on_Transitioned)
	if InitState:
		InitState.enter()
		CurrentState = InitState

func _process(delta: float) -> void:
	if CurrentState:
		CurrentState.update(delta)

func _physics_process(delta: float) -> void:
	if CurrentState:
		CurrentState.physics_update(delta)

func on_Transitioned(state:IState, new_state_name:String) -> void:
	if state != CurrentState:
		return
	var new_state:IState = States.get(new_state_name)
	if !new_state:
		return
	LastState = state
	if CurrentState:
		CurrentState.exit()
	new_state.enter()
	CurrentState = new_state
	print(CurrentState)
