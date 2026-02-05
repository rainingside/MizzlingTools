extends Resource
class_name ISkill

@export var SkillKey: String
@export var SkillName: String
@export var SkillRange: int
@export var Description: String
@export var Cooldown: float
@export var TargetSelector: ITargetSelector
@export var Conditions: Array[ISkillCondition] = []
@export var Effects: Array[ISkillEffect] = []

var CdLeftTime: float = 0.0

func update(delta: float) -> void:
	if is_cooldowning():
		CdLeftTime = clampf(CdLeftTime - delta, 0, Cooldown)

func is_cooldowning() -> bool:
	return CdLeftTime > 0

func cast(context: ISkillContext) -> void:
	if is_cooldowning():
		return
		
	var targets: Array[Node2D] = TargetSelector.select_targets(context)
	context.Targets = targets
	
	for condition: ISkillCondition in Conditions:
		if not condition.is_met(context):
			return
			
	for effect in Effects:
		effect.execute(context)
		
	CdLeftTime = Cooldown
