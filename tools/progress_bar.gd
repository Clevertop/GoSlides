extends ProgressBar

@export var speed : float = 2

func _process(delta: float) -> void:
	value = lerp(value, 100.0, speed * delta)

func _on_visibility_changed() -> void:
	if visible:
		value = 0
