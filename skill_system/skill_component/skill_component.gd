extends Node
class_name SkillComponent

var ActiveSkills: Dictionary = {}

func _ready() -> void:
	for skill: ISkill in get_children():
		ActiveSkills.set(skill.SkillId, skill)
