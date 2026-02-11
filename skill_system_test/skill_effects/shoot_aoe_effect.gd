extends ISkillEffect
class_name ShootAoeEffect

@export var CarryEffects: Array[ISkillEffect] = []
@export var AoeScenePath: String
@export var Duration: float


func execute(context: ISkillContext, _targets: Array[Node2D]) -> void:
	var aoe_scene: PackedScene = load(AoeScenePath)
	var aoe: Node2D = aoe_scene.instantiate()
	if aoe.has_method("init"):
		aoe.init(context, context.SelectPosition, CarryEffects, Duration)
	context.Source.get_tree().root.add_child(aoe)
