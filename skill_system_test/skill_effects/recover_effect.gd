extends ISkillEffect
class_name RecoverEffect

@export var Recover: int

func execute(context: ISkillContext) -> void:
	var recover_data: RecoverEffectData = RecoverEffectData.new()
	recover_data.Recover = Recover
	for target: Node2D in select_targets(context):
		AttributeInterface.recover(context.Source, target, recover_data.duplicate())
