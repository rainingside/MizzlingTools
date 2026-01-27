extends IMessage
class_name PopupWindowMessage

var PopupScenePath:String

func _init(popup_scene_path:String) -> void:
	PopupScenePath = popup_scene_path
