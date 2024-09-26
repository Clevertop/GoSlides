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
@export var exit_bar : ProgressBar

#Onready Variables

#Other Variables (please try to separate and organise!)
var slides : Array[Node]
var current_slide : int = 0
var total_slides : int

var exit_clock : float = 0

#endregion

#region Godot methods
func _ready():
	slides = slides_node.get_children()
	total_slides = slides_node.get_child_count()
	for slide in slides:
		disable_slide(slide)
	enable_slide(slides[current_slide])
	pass

func _process(delta):
	if(Input.is_action_just_pressed("next")):
		if current_slide < total_slides-1:
			show_next_slide()
	elif(Input.is_action_just_pressed("previous")):
		if current_slide > 0:
			show_previous_slide()
			
	if Input.is_action_pressed("exit"):
		exit_clock += delta
		if exit_clock > 2:
			get_tree().quit()
	else:
		exit_clock -= delta*3.5
		exit_clock = clamp(exit_clock, 0, 2)

	exit_bar.visible = exit_clock > 0
	exit_bar.value = exit_clock/2
	
	if Input.is_action_just_pressed("fullscreen"):
		if(DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED):
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	
#endregion

#region Signal methods

#endregion

#region Other methods (please try to separate and organise!)

func show_next_slide():
	disable_slide(slides[current_slide])
	current_slide += 1
	enable_slide(slides[current_slide])
	

func show_previous_slide():
	disable_slide(slides[current_slide])
	current_slide -= 1
	enable_slide(slides[current_slide])
	
func disable_slide(slide : Node):
	slide.hide()
	reset_videos(slide)
	slide.process_mode = Node.PROCESS_MODE_DISABLED
	
	
	
func enable_slide(slide : Node):
	slide.process_mode = Node.PROCESS_MODE_INHERIT
	slide.show()
	play_videos(slide)
	
func reset_videos(node : Node):
	for N in node.get_children():
		if N.get_child_count() > 0:
			reset_videos(N)
		if N is VideoStreamPlayer:
			N.stop()

func play_videos(node : Node):
	for N in node.get_children():
		if N.get_child_count() > 0:
			play_videos(N)
		if N is VideoStreamPlayer:
			N.play()


#endregion
