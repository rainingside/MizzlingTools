extends Node
class_name UIInerface

func load_main_scene(scene_path:String) -> void:
	GSignalBus.load_main_scene.emit(
		LoadMainSceneMessage.new(scene_path)
	)

func popup_window(popup_scene_path:String) -> void:
	GSignalBus.popup_windown.emit(
		PopupWindowMessage.new(popup_scene_path)
	)
