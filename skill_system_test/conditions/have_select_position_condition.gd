extends ISkillCondition
class_name HaveSelectPositionCondition

func is_met(context: ISkillContext) -> bool:
	if not context.SelectPosition:
		return false
	return true
