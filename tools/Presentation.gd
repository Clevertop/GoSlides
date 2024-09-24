extends Node
#class_name
#Authored by Tom. Please consult for any modifications or major feature requests.

#region Variables
#Signals

#Enums

#Constants

#Exported Variables
#@export_group("Group")
#@export_subgroup("Subgroup")
@export var slides_node : Control

#Onready Variables

#Other Variables (please try to separate and organise!)
var slides : Array[Node]
var current_slide : int = 0
var total_slides : int

#endregion

#region Godot methods
func _ready():
	slides = slides_node.get_children()
	total_slides = slides_node.get_child_count()
	for slide in slides:
		slide.hide()
	slides[current_slide].show()
	pass

func _process(delta):
	if(Input.is_action_just_pressed("next")):
		if current_slide < total_slides-1:
			show_next_slide()
	elif(Input.is_action_just_pressed("previous")):
		if current_slide > 0:
			show_previous_slide()
#endregion

#region Signal methods

#endregion

#region Other methods (please try to separate and organise!)

func show_next_slide():
	slides[current_slide].hide()
	current_slide += 1
	slides[current_slide].show()
	

func show_previous_slide():
	slides[current_slide].hide()
	current_slide -= 1
	slides[current_slide].show()
	

#endregion
