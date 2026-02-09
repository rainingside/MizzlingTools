extends Control

@export var Target: Node2D

var BuffStatusScene: PackedScene = preload("uid://dlc4h675cmxn")
var Buffs: Dictionary = {}

@onready var h_box_container: HBoxContainer = $HBoxContainer

func _ready() -> void:
	var buff_cmpt: BuffComponent = Target.get_node("BuffComponent")
	buff_cmpt.buff_added.connect(on_buff_added)
	buff_cmpt.buff_removed.connect(on_buff_removed)

func on_buff_added(buff: IBuff) -> void:
	var buff_scene: BuffStatus = BuffStatusScene.instantiate()
	buff_scene.BuffInstance = buff
	Buffs.set(buff, buff_scene)
	h_box_container.add_child(buff_scene)
	
func on_buff_removed(buff: IBuff) -> void:
	var buff_scene: BuffStatus = Buffs.get(buff)
	Buffs.erase(buff)
	if buff_scene:
		buff_scene.queue_free()
