extends ISkillEffect
class_name ShootProjectileEffect

@export var CarryEffects: Array[ISkillEffect] = []
@export var ProjectileScenePath: String
@export var Speed: int

func execute(context: ISkillContext, targets: Array[Node2D]) -> void:
	for target: Node2D in targets:
		var projectile_scene: PackedScene = load(ProjectileScenePath)
		var projectile: Node2D = projectile_scene.instantiate()
		if projectile.has_method("init"):
			projectile.init(context, target, CarryEffects, Speed)
		context.Source.get_tree().root.add_child(projectile)
