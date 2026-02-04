extends Resource
class_name ISkillEffect

var TargetSelector: ITargetSelector
var Executor: IEffectExecutor

func execute(context: IEffectContext) -> void:
	var targets: Array[Node2D] = TargetSelector.select_targets(context)
	Executor.execute(context, targets)
