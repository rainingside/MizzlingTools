extends IBuffEffect
class_name ZaishengBEfefect

var Bonus: int = 1

func on_stack(buff: IBuff, stack_buff: IBuff, _target: Node2D) -> void:
	buff.Duration += stack_buff.Duration
	buff.Stacks += stack_buff.Stacks

func on_tick(buff: IBuff, target: Node2D, source: Node2D) -> void:
	var recover_data: RecoverEffectData = RecoverEffectData.new()
	recover_data.Recover = Bonus * buff.Stacks
	
	AttributeInterface.recover(source, target, recover_data)
