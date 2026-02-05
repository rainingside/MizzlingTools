extends Node
class_name SkillComponent

## key: skill_key value:skill
var ActiveSkills: Dictionary = {}

var Source: Node2D

func init_skills(skills: Array[ISkill]) -> void:
	for skill: ISkill in skills:
		ActiveSkills.set(skill.SkillKey, skill)
		
func _ready() -> void:
	Source = get_parent()

func _process(delta: float) -> void:
	for skill: ISkill in ActiveSkills:
		skill.update(delta)

func cast(skill_key: String) -> void:
	var skill: ISkill = ActiveSkills.get(skill_key)
	if not skill:
		return
	var context: ISkillContext = ISkillContext.new()
	context.Source = Source
	context.SkillInstance = skill
	skill.cast(context)
