extends ISkillEffect
class_name DirectDamageEffect

@export var Damage: int

func execute(context: ISkillContext, targets: Array[Node2D]) -> void:
	var data: AttackEffectData = AttackEffectData.new()
	data.Damage = Damage
	for target: Node2D in targets:
		AttributeInterface.attack(context.Source, target, data.duplicate(true))
	
