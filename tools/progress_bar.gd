extends ProgressBar

@export var speed : float = 2
@export var target_value : float

func _ready():
	max_value = 60000

func _process(delta: float) -> void:
	value = lerp(value, target_value, speed * delta)

func _on_visibility_changed() -> void:
	if visible:
		$Timer.start(0)

func _on_timer_timeout() -> void:
	value = 0
