extends Node
class_name BuffComponent

var ActiveBuffs: Dictionary = {}

signal buff_added(buff: IBuff)
signal buff_updated(buff: IBuff)
signal buff_removed(buff: IBuff)

var Target: Node2D

func _ready() -> void:
	Target = get_parent()

func _process(delta: float) -> void:
	for buff:IBuff in ActiveBuffs.values():
		buff.update(delta)
		
		if buff.Stacks <= 0:
			remove_buff(buff.BuffId)
			return

		if buff.is_ticked():
			buff.on_tick(Target)
		if buff.is_expired():
			remove_buff(buff.BuffId)

func add_buff(buff: IBuff) -> void:
	var exit_buff: IBuff = ActiveBuffs.get(buff.BuffId)
	if exit_buff:
		exit_buff.on_stack(buff, Target)
		buff_updated.emit(exit_buff)
	else:
		ActiveBuffs.set(buff.BuffId, buff)
		buff_added.emit(buff)

func remove_buff(buff_id: int) -> void:
	var exit_buff: IBuff = ActiveBuffs.get(buff_id)
	if exit_buff:
		ActiveBuffs.erase(buff_id)
		buff_removed.emit(exit_buff)
	

func on_attacking() -> void:
	for buff:IBuff in ActiveBuffs.values():
		buff.on_attacking(Target)
		buff_updated.emit(buff)

func on_attacked() -> void:
	for buff:IBuff in ActiveBuffs.values():
		buff.on_attacked(Target)
		buff_updated.emit(buff)
