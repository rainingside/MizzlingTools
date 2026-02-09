extends IBuffEffect
class_name ZhongduBEfefect

var Bonus:int = 1

func on_stack(buff: IBuff, stack_buff: IBuff, _target: Node2D) -> void:
	buff.Duration += stack_buff.Duration
	buff.Stacks += stack_buff.Stacks

func on_tick(buff: IBuff, target: Node2D, source: Node2D) -> void:
	var attack_data: AttackEffectData = AttackEffectData.new()
	attack_data.Damage = Bonus * buff.Stacks
	
	AttributeInterface.attack(source, target, attack_data)
	buff.Stacks -= 1
