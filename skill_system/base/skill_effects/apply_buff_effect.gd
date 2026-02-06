extends ISkillEffect
class_name ApplyBuffEffect

@export var ApplyBuffs: Array[IBuff]

func execute(context: ISkillContext) -> void:
	if context.Targets.size() == 0:
		return
	
	for buff: IBuff in ApplyBuffs:
		buff.Source = context.Source
	
	for target: Node2D in context.Targets:
		var buff_component: BuffComponent = target.get_node("BuffComponent")
		if not buff_component:
			continue
		buff_component.add_buffs(ApplyBuffs)
