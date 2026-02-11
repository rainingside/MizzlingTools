extends ISkillCondition
class_name HaveTargetCondition

func is_met(context: ISkillContext) -> bool:
	if not context.SelectTarget:
		return false
	return true
