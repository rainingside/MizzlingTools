extends Node
class_name IBuff

var BuffType: int
var BuffName: String
var Duration: float = 4
var Stacks: int = 1
var TickInterval: float = 0.0
var IsPermanent:bool = false

var BuffEffect: IBuffEffect

var ElapsedTime: float = 0.0
var TimeSinceLastTick: float = 0.0 

func update(delta: float) -> void:
	if not IsPermanent:
		ElapsedTime += delta
		
	if TickInterval > 0:
		TimeSinceLastTick += delta

func is_expired() -> bool:
	if IsPermanent:
		return false
	return ElapsedTime >= Duration

func is_ticked() -> bool:
	return TickInterval > 0 and TimeSinceLastTick >= TickInterval

func reset_tick() -> void:
	TimeSinceLastTick = 0.0

func on_tick(target: Node2D) -> void:
	BuffEffect.on_tick(self, target)

func on_attacking(target: Node2D) -> void:
	BuffEffect.on_attacking(self, target)

func on_attacked(target: Node2D) -> void:
	BuffEffect.on_attacked(self, target)
