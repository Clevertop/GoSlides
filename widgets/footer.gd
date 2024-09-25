@tool
extends PanelContainer

@export var text : String :
	set(value):
		text = value
		text_label.text = text
@export_group("Node References")
@export var text_label : Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
