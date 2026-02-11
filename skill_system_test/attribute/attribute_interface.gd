extends Node
class_name AttributeInterface

@export var AttrInstance: Attribute

static func attack(source: Node2D, target: Node2D, attack_data: AttackEffectData) -> void:
	var buff_component: BuffComponent = source.get_node("BuffComponent")
	for buff: IBuff in buff_component.ActiveBuffs.values():
		buff.on_attacking(source, attack_data)
	
	attacked(source, target, attack_data)

static func attacked(source: Node2D, target: Node2D, attack_data: AttackEffectData) -> void:
	var buff_component: BuffComponent = target.get_node("BuffComponent")
	for buff: IBuff in buff_component.ActiveBuffs.values():
		buff.on_attacked(source, attack_data)
	var target_interface: AttributeInterface = target.get_node("AttributeInterface")
	target_interface.AttrInstance.Health -= attack_data.Damage

static func recover(source: Node2D, target: Node2D, recover_data: RecoverEffectData) -> void:
	var buff_component: BuffComponent = source.get_node("BuffComponent")
	for buff: IBuff in buff_component.ActiveBuffs:
		buff.on_recover(source, recover_data)
	
	var target_buff_component: BuffComponent = target.get_node("BuffComponent")
	for buff: IBuff in target_buff_component.ActiveBuffs:
		buff.on_recover(target, recover_data) 
	
	var target_interface: AttributeInterface = target.get_node("AttributeInterface")
	target_interface.AttrInstance.Health += recover_data.Recover
