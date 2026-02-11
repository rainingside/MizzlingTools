extends Area2D

var SkillContext: ISkillContext
var TargetPosition: Vector2
var CarryEffects: Array[ISkillEffect] = []
var Duration: float = 5

@onready var free_timer: Timer = $FreeTimer


func init(context: ISkillContext, target_positon: Vector2, carry_effects: Array[ISkillEffect], duration: float) -> void:
	SkillContext = context
	TargetPosition = target_positon
	CarryEffects.append_array(carry_effects)
	Duration = duration

func _ready() -> void:
	global_position = TargetPosition
	body_entered.connect(on_body_entered)
	
	free_timer.timeout.connect(on_free_timer_timeout)
	free_timer.wait_time = Duration
	free_timer.start()

func on_body_entered(body: Node2D) -> void:
	for effect: ISkillEffect in CarryEffects:
		effect.execute(SkillContext, [body])

func on_free_timer_timeout() -> void:
	queue_free()
