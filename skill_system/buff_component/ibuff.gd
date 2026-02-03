extends Node
class_name IBuff

var BuffType: int
var BuffName: String
var Duration: float = 4
var Stacks: int = 1
var TickInterval: float = 0.0
var IsPermanent:bool = false
var Executor: IBuffEffectExecutor
var EffectContext: IEffectContext

signal buff_elapsed(buff_type: int)

var ElapsedTime: float = 0.0
var TimeSinceLastTick: float = 0.0 

func update(delta: float) -> void:
	ElapsedTime += delta
	TimeSinceLastTick += delta
	
	if TickInterval > 0 and TimeSinceLastTick >= TickInterval:
		TimeSinceLastTick = 0.0
		if Executor:
			Executor.execute(EffectContext, self)

	if ElapsedTime >= Duration:
		buff_elapsed.emit(BuffType)

func stack_with(buff: IBuff) -> void:
	EffectContext = buff.EffectContext
	ElapsedTime += buff.Duration
	Stacks += buff.Stacks
