extends Resource
class_name ISkillEffect

@export var TargetSelector: ITargetSelector

func execute(_context: ISkillContext) -> void:
	pass

func select_targets(context: ISkillContext) -> Array[Node2D]:
	return TargetSelector.select_targets(context)
