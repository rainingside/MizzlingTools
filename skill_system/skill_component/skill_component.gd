extends Node
class_name SkillComponent

@export var Selector: SelectorComponent

## key: skill_key value:skill
var ActiveSkills: Dictionary = {}

var Source: Node2D
var CdBouns: float = 0.0:
	set(value):
		CdBouns = clampf(value, 0.0, 0.5)

func init_skills(skills: Array[ISkill]) -> void:
	for skill: ISkill in skills:
		ActiveSkills.set(skill.SkillKey, skill)
		if skill.IsPassive:
			var context: ISkillContext = ISkillContext.new()
			context.Source = Source
			context.SkillInstance = skill
			skill.cast_passive(context)
		
func _ready() -> void:
	Source = get_parent()

func _process(delta: float) -> void:
	for skill: ISkill in ActiveSkills.values():
		skill.update(delta, self)

func cast(skill_key: String) -> void:
	var skill: ISkill = ActiveSkills.get(skill_key)
	if not skill or skill.IsPassive:
		return
	var context: ISkillContext = ISkillContext.new()
	context.Source = Source
	context.SkillInstance = skill
	context.SelectTarget = Selector.SelectTarget
	context.SelectPosition = Selector.SelectPosition
	skill.cast(context)
