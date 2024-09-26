@tool
extends PanelContainer
#class_name
#Authored by Tom. Please consult for any modifications or major feature requests.

#region Variables
#Signals

#Enums

#Constants

#Exported Variables
#@export_group("Group")
#@export_subgroup("Subgroup")
@export var title : String:
	set(value) :
		title = value
		title_node.text = title
@export var subtitle : String:
	set(value) : 
		subtitle = value
		subtitle_node.text = subtitle
		subtitle_node.visible = subtitle_node.text != ""
@export_group("Node References")
@export var title_node : Label
@export var subtitle_node : Label

#Onready Variables

#Other Variables (please try to separate and organise!)

#endregion

#region Godot methods
func _ready():
	#Runs when all children have entered the tree
	pass

func _process(_delta):
	#Runs per frame
	pass
#endregion

#region Signal methods

#endregion

#region Other methods (please try to separate and organise!)
#func set_title(text : String):
	#title = text
	#title_node.text = title
	#
#func set_subtitle(text : String):
	#subtitle = text
	#subtitle_node.text = title
	#subtitle_node.visible = subtitle_node.text != ""
#endregion
