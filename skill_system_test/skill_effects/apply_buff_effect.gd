extends ISkillEffect
class_name ApplyBuffEffect

@export var ApplyBuffs: Array[IBuff]

func execute(context: ISkillContext, targets: Array[Node2D]) -> void:
	for buff: IBuff in ApplyBuffs:
		buff.Source = context.Source
	for target: Node2D in targets:
		var buff_component: BuffComponent = target.get_node("BuffComponent")
		if not buff_component:
			continue
		buff_component.add_buffs(ApplyBuffs)
