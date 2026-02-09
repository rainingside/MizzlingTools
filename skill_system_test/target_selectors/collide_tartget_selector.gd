extends ITargetSelector
class_name CollideTargetSelector

var CollideTarget: Node2D

func select_targets(_context: ISkillContext) -> Array[Node2D]:
	var targets: Array[Node2D] = []
	targets.append(CollideTarget)
	return targets
