extends IMessage
class_name TargetSelectedMessage

var Target: Node2D

func _init(target: Node2D) -> void:
	Target = target
