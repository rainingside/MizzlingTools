extends CharacterBody2D
class_name Player

@export var Speed: int = 100
var TargetPosition: Vector2

@onready var selector_component: SelectorComponent = $SelectorComponent
@onready var skill_component: SkillComponent = $SkillComponent

func _ready() -> void:
	skill_component.init_skills([
		load("uid://e0wcyqwp422a"),
		load("uid://boitsk4r2b1wm")
	])
	TargetPosition = global_position
	GSignalBus.target_selected.connect(on_target_selected)

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("select"):
		TargetPosition = get_global_mouse_position()
		selector_component.SelectPosition = TargetPosition
	if Input.is_action_just_pressed("skill1"):
		skill_component.cast("close_atk")
	elif Input.is_action_just_pressed("skill2"):
		skill_component.cast("shoot_fireball")
	
	if TargetPosition != global_position:
		var collider: KinematicCollision2D = move_and_collide((TargetPosition - global_position).normalized() * Speed * delta)
		if collider:
			TargetPosition = global_position
	else:
		velocity = Vector2(0, 0)


func on_target_selected(msg: TargetSelectedMessage) -> void:
	selector_component.SelectTarget = msg.Target
