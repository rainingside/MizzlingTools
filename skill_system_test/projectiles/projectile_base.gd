extends Area2D

var SkillContext: ISkillContext
var Target: Node2D
var CarryEffects: Array[ISkillEffect] = []
var Speed: int = 100

func init(context: ISkillContext, target: Node2D, carry_effects: Array[ISkillEffect], speed: int) -> void:
	SkillContext = context
	Target = target
	CarryEffects.append_array(carry_effects)
	Speed = speed

func _ready() -> void:
	global_position = SkillContext.Source.global_position
	
	if SkillContext.Source is Player:
		collision_layer = 3
		collision_mask = 2
	else:
		collision_layer = 4
		collision_mask = 1
	body_entered.connect(on_body_entered)

func _physics_process(delta: float) -> void:
	global_position += (Target.global_position - global_position).normalized() * Speed * delta

func on_body_entered(body: Node2D) -> void:
	if not body == Target:
		return
	
	for effect: ISkillEffect in CarryEffects:
		effect.execute(SkillContext, [body])
	
	queue_free()
