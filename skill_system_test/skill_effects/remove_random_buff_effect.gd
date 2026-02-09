extends ISkillEffect
class_name RemoveRandomBuffEffect

@export var RemoveBuffType: SkillEnums.BuffTypes
@export var RemoveCount: int

func execute(context: ISkillContext) -> void:
	var targets: Array[Node2D] = select_targets(context)
	for target: Node2D in targets:
		var buff_component: BuffComponent = target.get_node("BuffComponent")
		if not buff_component:
			continue
		for buff_key: String in get_buff_keys(buff_component):
			buff_component.remove_buff(buff_key)

func get_buff_keys(buff_component: BuffComponent) -> Array[String]:
	var buff_keys: Array[String] = []
	for buff: IBuff in buff_component.ActiveBuffs.values():
		if buff.BuffType == RemoveBuffType:
			buff_keys.append(buff.BuffKey)
	if buff_keys.size() <= RemoveCount:
		return buff_keys
	buff_keys.shuffle()
	return buff_keys.slice(0, RemoveCount)
