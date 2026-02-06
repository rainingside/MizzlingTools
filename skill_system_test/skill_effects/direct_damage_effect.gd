extends ISkillEffect
class_name DirectDamageEffect

@export var Damage: int

func execute(context: ISkillContext) -> void:
	var data: AttackEffectData = AttackEffectData.new()
	data.Damage = Damage
	for target: Node2D in context.Targets:
		AttributeInterface.attack(context.Source, target, data.duplicate())
	
