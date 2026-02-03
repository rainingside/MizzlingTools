extends Node
class_name BuffComponent

var ActiveBuffs: Dictionary = {}

signal buff_add(buff: IBuff)
signal buff_update(buff: IBuff)
signal buff_removed(buff: IBuff)

func _process(delta: float) -> void:
	for buff:IBuff in ActiveBuffs.values():
		buff.update(delta)

func add_buff(buff: IBuff) -> void:
	var exit_buff: IBuff = ActiveBuffs.get(buff.BuffType)
	if exit_buff:
		exit_buff.stack_with(buff)
		buff_update.emit(exit_buff)
	else:
		buff.buff_elapsed.connect(on_buff_elapsed)
		ActiveBuffs.set(buff.BuffType, buff)
		buff_add.emit(buff)

func remove_buff(buff_type: int) -> void:
	var exit_buff: IBuff = ActiveBuffs.get(buff_type)
	ActiveBuffs.erase(buff_type)
	if exit_buff:
		buff_removed.emit(exit_buff)

func on_buff_elapsed(buff_type: int) -> void:
	remove_buff(buff_type)
	
