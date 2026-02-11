extends ISkillEffect
class_name RemoveBuffEffect

@export var BuffKeys: Array[String] = []

func execute(_context: ISkillContext, targets: Array[Node2D]) -> void:
	for target: Node2D in targets:
		var buff_component: BuffComponent = target.get_node("BuffComponent")
		if not buff_component:
			continue
		buff_component.remove_buffs(BuffKeys)
