extends Resource
class_name ISkillEffect

var Executors: Array[IEffectExecutor] = []

func execute(context: IEffectContext) -> void:
	for executor in Executors:
		executor.execute(context)
