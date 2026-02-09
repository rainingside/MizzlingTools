extends ISkillEffect
class_name ShootProjectileEffect

@export var CarryEffects: Array[ISkillEffect] = []
@export var ProjectileScenePath: String

func execute(context: ISkillContext) -> void:
	for target: Node2D in select_targets(context):
		var projectile_scene: PackedScene = load(ProjectileScenePath)
		var projectile: Node2D = projectile_scene.instantiate()
		if projectile.has_method("init_projectile"):
			projectile.init_projectile(context, target, CarryEffects)
		context.Source.get_tree().root.add_child(projectile)
		
