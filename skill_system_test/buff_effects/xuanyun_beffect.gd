extends IBuffEffect
class_name XuanyunBEfefect

func on_stack(buff: IBuff, stack_buff: IBuff, _target: Node2D) -> void:
	buff.Duration += stack_buff.Duration
