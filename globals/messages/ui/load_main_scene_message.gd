extends IMessage
class_name LoadMainSceneMessage

var ScenePath:String

func _init(scene_path:String) -> void:
	ScenePath = scene_path
