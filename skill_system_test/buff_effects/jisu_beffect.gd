extends IBuffEffect
class_name JisuBEfefect

var Bonus: float = 0.1

func on_apply(buff: IBuff, target: Node2D) -> void:
	var skill_component: SkillComponent = target.get_node("SkillComponent")
	skill_component.CdBouns = buff.Stacks * Bonus

func on_remove(_buff: IBuff, target: Node2D) -> void:
	var skill_component: SkillComponent = target.get_node("SkillComponent")
	skill_component.CdBouns = 0

func on_stack(buff: IBuff, stack_buff: IBuff, target: Node2D) -> void:
	buff.Duration += stack_buff.Duration
	buff.Stacks += stack_buff.Stacks
	var skill_component: SkillComponent = target.get_node("SkillComponent")
	skill_component.CdBouns = buff.Stacks * Bonus
