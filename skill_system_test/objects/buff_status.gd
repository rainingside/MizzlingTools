extends Control
class_name BuffStatus


var BuffInstance: IBuff


@onready var buff_name_label: Label = $BuffNameLabel
@onready var buff_stack_label: Label = $BuffStackLabel
@onready var buff_cd_label: Label = $BuffCdLabel

func _ready() -> void:
	BuffInstance.stacks_updated.connect(on_stacks_updated)
	BuffInstance.lefttime_updated.connect(on_lefttime_updated)
	buff_name_label.text = BuffInstance.BuffName
	set_countdown()

func set_countdown() -> void:
	if BuffInstance.IsPermanent:
		buff_cd_label.text = "永久"
	else:
		buff_cd_label.text = String.num(BuffInstance.Duration - BuffInstance.ElapsedTime, 1)

func on_stacks_updated() -> void:
	buff_stack_label.text = str(BuffInstance.Stacks)

func on_lefttime_updated() -> void:
	set_countdown()
