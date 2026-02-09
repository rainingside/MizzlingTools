extends Area2D

var SkillContext: ISkillContext
var Target: Node2D
@export var CarryEffects: Array[ISkillEffect] = []
@export var Speed: int = 100

func init_projectile(context: ISkillContext, target: Node2D, carry_effects: Array[ISkillEffect]) -> void:
	SkillContext = context
	Target = target
	CarryEffects.append_array(carry_effects)

func _ready() -> void:
	body_entered.connect(on_body_entered)

func _physics_process(delta: float) -> void:
	position += (Target.position - position).normalized() * Speed * delta

func on_body_entered(body: Node2D) -> void:
	if not body == Target:
		return
	
	for effect: ISkillEffect in CarryEffects:
		if effect.TargetSelector is CollideTargetSelector:
			effect.TargetSelector.CollideTarget = body
		effect.execute(SkillContext)
	queue_free()
