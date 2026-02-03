extends Timer
class_name CooldownTimer

var CooldownTime: float = 3.0

var IsCooldowning: bool = false

func _ready() -> void:
	wait_time = CooldownTime
	one_shot = true
	autostart = false
	timeout.connect(on_cooldown_finished)

func start_cooldown() -> void:
	if IsCooldowning:
		return
	IsCooldowning = true
	start()

func on_cooldown_finished() -> void:
	IsCooldowning = false
