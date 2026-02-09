extends Control

@export var Target: Node2D

var AttrInstance: Attribute

@onready var progress_bar: ProgressBar = $ProgressBar

func _ready() -> void:
	AttrInstance = (Target.get_node("AttributeInterface") as AttributeInterface).AttrInstance
	AttrInstance.health_changed.connect(on_health_changed)
	
	progress_bar.max_value = AttrInstance.MaxHealth
	progress_bar.value = AttrInstance.Health

func on_health_changed(health: int) -> void:
	progress_bar.value = health
