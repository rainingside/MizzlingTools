extends Node
class_name ISkill

@export var SkillId: int
@export var SkillName: String
@export var Cooldown:float
@export var Effects: Array[ISkillEffect] = []

@export var CdTimer:CooldownTimer

func _ready() -> void:
	CdTimer.CooldownTime = Cooldown

func cast(context: IEffectContext) -> void:
	if not get_skill_is_ready():
		return
	
	for effect in Effects:
		effect.execute(context)
	
	CdTimer.start_cooldown()

func get_skill_is_ready() -> bool:
	return not CdTimer.IsCooldowning
