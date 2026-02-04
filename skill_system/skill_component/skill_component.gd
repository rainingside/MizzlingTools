extends Node
class_name SkillComponent

var ActiveSkills: Dictionary = {}

var Source: Node2D

func _ready() -> void:
	Source = get_parent()

func init_skills(skills: Array[ISkill]) -> void:
	for skill: ISkill in skills:
		ActiveSkills.set(skill.SkillId, skill)

func cast(skill_id: int) -> void:
	var skill: ISkill = ActiveSkills.get(skill_id)
	if not skill_id:
		return
	var context: IEffectContext = IEffectContext.new()
	context.Source = Source
	context.SkillInstance = skill
	skill.cast(context)
