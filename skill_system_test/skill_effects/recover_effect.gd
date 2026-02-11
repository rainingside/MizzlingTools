extends ISkillEffect
class_name RecoverEffect

@export var Recover: int

func execute(context: ISkillContext, targets: Array[Node2D]) -> void:
	var recover_data: RecoverEffectData = RecoverEffectData.new()
	recover_data.Recover = Recover
	for target: Node2D in targets:
		AttributeInterface.recover(context.Source, target, recover_data.duplicate(true))
