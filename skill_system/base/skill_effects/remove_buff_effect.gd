extends ISkillEffect
class_name RemoveBuffEffect

@export var BuffKeys: Array[String] = []

func execute(context: ISkillContext) -> void:
	if context.Targets.size() == 0:
		return
	
	for target: Node2D in context.Targets:
		var buff_component: BuffComponent = target.get_node("BuffComponent")
		if not buff_component:
			continue
		buff_component.remove_buffs(BuffKeys)
