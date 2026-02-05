extends Node
class_name BuffComponent

## key: buff_key value:buff
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
			remove_buff(buff.BuffName)
			return

		if buff.is_ticked():
			buff.on_tick(Target)
		if buff.is_expired():
			remove_buff(buff.BuffName)

func add_buff(buff: IBuff) -> void:
	var exit_buff: IBuff = ActiveBuffs.get(buff.BuffKey)
	if exit_buff:
		exit_buff.on_stack(buff, Target)
		buff_updated.emit(exit_buff)
	else:
		ActiveBuffs.set(buff.BuffKey, buff)
		buff_added.emit(buff)

func add_buffs(buffs: Array[IBuff]) -> void:
	for buff: IBuff in buffs:
		add_buff(buff)

func remove_buff(buff_key: String) -> void:
	var exit_buff: IBuff = ActiveBuffs.get(buff_key)
	if exit_buff:
		ActiveBuffs.erase(buff_key)
		buff_removed.emit(exit_buff)

func remove_buffs(buff_keys: Array[String]) -> void:
	for buff_key: String in buff_keys:
		remove_buff(buff_key)

func on_attacking() -> void:
	for buff:IBuff in ActiveBuffs.values():
		buff.on_attacking(Target)
		buff_updated.emit(buff)

func on_attacked() -> void:
	for buff:IBuff in ActiveBuffs.values():
		buff.on_attacked(Target)
		buff_updated.emit(buff)
