extends ISkillCondition
class_name SkillRangeCondition

func is_met(context: ISkillContext) -> bool:
	if not context.SelectPosition:
		return false
	var length: float = (context.SelectPosition - context.Source.global_position).length()
	if length > context.SkillInstance.SkillRange:
		return false
	return true
