extends ITargetSelector
class_name RangeTargetSelector

@export var Radius: int = 50

func select_targets(context: ISkillContext) -> Array[Node2D]:
	var targets: Array[Node2D] = []
	if not context.SelectPosition:
		return targets
		
	var shape_cast2d: ShapeCast2D = ShapeCast2D.new()
	var shape: CircleShape2D = CircleShape2D.new()
	shape.radius = Radius
	shape_cast2d.shape = shape
	shape_cast2d.collide_with_bodies = true
	if context.Source is Player:
		shape_cast2d.collision_mask = 2
	else:
		shape_cast2d.collision_mask = 1
	context.Source.get_tree().root.add_child(shape_cast2d)
	shape_cast2d.global_position = GSkill.SelectPosition
	shape_cast2d.force_shapecast_update()
	if shape_cast2d.is_colliding():
		var collision_count: int = shape_cast2d.get_collision_count()
		for i in range(collision_count):
			var collider: Node2D = shape_cast2d.get_collider(i)
			if collider:
				targets.append(collider)
	shape_cast2d.queue_free()
	
	return targets
