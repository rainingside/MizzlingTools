extends IBuffEffect
class_name YishangBEfefect

var Bonus:int = 1

func on_stack(buff: IBuff, stack_buff: IBuff, _target: Node2D) -> void:
	buff.Stacks += stack_buff.Stacks
	buff.Duration += stack_buff.Duration

func on_attacked(buff: IBuff, _target: Node2D, effect_data: IEffectData) -> void:
	if effect_data is AttackEffectData:
		if effect_data.Damage > 0:
			effect_data.Damage += Bonus * buff.Stacks
