extends ISkillEffect
class_name RemoveBuffEffect

@export var BuffKeys: Array[String] = []

func execute(context: ISkillContext) -> void:
	var targets: Array[Node2D] = select_targets(context)
	for target: Node2D in targets:
		var buff_component: BuffComponent = target.get_node("BuffComponent")
		if not buff_component:
			continue
		buff_component.remove_buffs(BuffKeys)
