extends Resource
class_name ISkill

@export var SkillId: int
@export var SkillName: String
@export var Cooldown:float
@export var Effects: Array[ISkillEffect] = []

var CdLeftTime: float = 0.0

func _process(delta: float) -> void:
	if is_cooldowning():
		CdLeftTime = clampf(CdLeftTime - delta, 0, Cooldown)

func is_cooldowning() -> bool:
	return CdLeftTime > 0

func cast(context: IEffectContext) -> void:
	if is_cooldowning():
		return
	for effect in Effects:
		effect.execute(context)
	CdLeftTime = Cooldown
