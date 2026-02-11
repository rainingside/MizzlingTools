extends Resource
class_name ISkill

@export var SkillKey: String
@export var SkillName: String
@export var SkillRange: int
@export var IsPassive: bool
@export var Cooldown: float
@export var Conditions: Array[ISkillCondition] = []
@export var EffectAndSelectors: Array[IEffectAndSelector]
@export var Description: String

var CdLeftTime: float = 0.0:
	set(value):
		CdLeftTime = value
		cd_lefttime_changed.emit(value)

signal cd_lefttime_changed(cd_lefttime: float)

func update(delta: float, skill_component: SkillComponent) -> void:
	if is_cooldowning():
		CdLeftTime = clampf(CdLeftTime - delta * (skill_component.CdBouns + 1), 0, Cooldown)

func is_cooldowning() -> bool:
	return CdLeftTime > 0

func cast(context: ISkillContext) -> void:
	if is_cooldowning():
		return
	
	for condition: ISkillCondition in Conditions:
		if not condition.is_met(context):
			return
			
	execute_effects(context)
		
	CdLeftTime = Cooldown

func cast_passive(context: ISkillContext) -> void:
	execute_effects(context)

func execute_effects(context: ISkillContext) -> void:
	for item: IEffectAndSelector in EffectAndSelectors:
		var targets: Array[Node2D] = item.Selector.select_targets(context)
		item.Effect.execute(context, targets)
	
