extends Node
class_name UIManager

@export var MainArea: Panel
@export var PopupArea: Panel

var NowMainNode: Node
var NowPopupNode: Control

func _ready() -> void:
	GSignalBus.load_main_scene.connect(on_load_main_scene)
	GSignalBus.popup_windown.connect(on_popup_windown)
	PopupArea.gui_input.connect(on_gui_input)
	
func on_load_main_scene(msg: LoadMainSceneMessage) -> void:
	load_main_scene(msg.ScenePath)

func on_popup_windown(msg:PopupWindowMessage) -> void:
	popup_windown(msg.PopupScenePath)

func on_gui_input(event: InputEvent) -> void:
	if event.is_action_released("close_popup"):
		close_popup()

func load_main_scene(scene_path: String) -> void:
	close_popup()
	if NowMainNode:
		NowMainNode.queue_free()
	var scene:PackedScene = load(scene_path)
	NowMainNode = scene.instantiate()
	MainArea.add_child(NowMainNode)

func popup_windown(popup_scene_path:String) -> void:
	if NowPopupNode:
		NowPopupNode.queue_free()
		NowPopupNode = null
	var scene:PackedScene = load(popup_scene_path)
	NowPopupNode = scene.instantiate()
	PopupArea.add_child(NowPopupNode)
	var x:float = (PopupArea.size.x - NowPopupNode.size.x) / 2
	var y:float = (PopupArea.size.y - NowPopupNode.size.y) / 2
	NowPopupNode.position = Vector2(x, y)
	PopupArea.visible = true

func close_popup() -> void:
	if NowPopupNode:
		NowPopupNode.queue_free()
		NowPopupNode = null
	PopupArea.visible = false
	
	
	
	
