extends Resource
class_name IBuff

@export var BuffKey: String
@export var BuffType: SkillEnums.BuffTypes
@export var BuffName: String
@export var Duration: float = 4
@export var Stacks: int = 1
@export var TickInterval: float = 0.0
@export var IsPermanent:bool = false
@export var BuffEffect: IBuffEffect

var Source: Node2D

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

func on_stack(stack_buff: IBuff, target: Node2D) -> void:
	BuffEffect.on_stack(self, stack_buff, target)

func is_ticked() -> bool:
	return TickInterval > 0 and TimeSinceLastTick >= TickInterval

func reset_tick() -> void:
	TimeSinceLastTick = 0.0

func on_tick(target: Node2D) -> void:
	BuffEffect.on_tick(self, target, Source)

func on_attacking(target: Node2D, effect_data: IEffectData) -> void:
	BuffEffect.on_attacking(self, target, effect_data)

func on_attacked(target: Node2D, effect_data: IEffectData) -> void:
	BuffEffect.on_attacked(self, target, effect_data)

func on_recover(target: Node2D, effect_data: IEffectData) -> void:
	BuffEffect.on_recover(self, target, effect_data)
