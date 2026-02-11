extends ITargetSelector
class_name TargetSelector

func select_targets(context: ISkillContext) -> Array[Node2D]:
	var targets: Array[Node2D] = []
	if context.SelectTarget:
		targets.append(context.SelectTarget)
	return targets
