extends Resource
class_name IBuffEffect

func on_apply(_buff: IBuff, _target: Node2D) -> void:
	pass

func on_stack(_buff: IBuff, _stack_buff: IBuff, _target: Node2D) -> void:
	pass
	
func on_tick(_buff: IBuff, _target: Node2D, _source: Node2D) -> void:
	pass

func on_remove(_buff: IBuff, _target: Node2D) -> void:
	pass

func on_attacking(_buff: IBuff, _target: Node2D, _effect_data: IEffectData) -> void:
	pass

func on_attacked(_buff: IBuff, _target: Node2D, _effect_data: IEffectData) -> void:
	pass
	
func on_recover(_buff: IBuff, _target: Node2D, _effect_data: IEffectData) -> void:
	pass
