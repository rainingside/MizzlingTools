extends IBuffEffect
class_name ShendunBEfefect

func on_stack(buff: IBuff, stack_buff: IBuff, _target: Node2D) -> void:
	buff.Stacks += stack_buff.Stacks
	buff.Duration += stack_buff.Duration

func on_attacked(_buff: IBuff, _target: Node2D, effect_data: IEffectData) -> void:
	if effect_data is AttackEffectData:
		effect_data.Damage  = 0
