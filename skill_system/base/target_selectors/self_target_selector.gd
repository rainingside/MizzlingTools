extends ITargetSelector

func select_targets(context: ISkillContext) -> Array[Node2D]:
	var targets: Array[Node2D] = []
	targets.append(context.Source)
	return targets
