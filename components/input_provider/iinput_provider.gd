extends Node
class_name IInputProvider

func get_move_vector() -> Vector2:
	return Vector2.ZERO

# 子类需要重写此方法，检查动作是否在当前帧被按下
func is_action_just_pressed(_action: String) -> bool:
	return false

# 子类需要重写此方法，检查动作是否被持续按下
func is_action_pressed(_action: String) -> bool:
	return false
