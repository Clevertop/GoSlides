extends Control

@export var textureRect : TextureRect
@export var images : Array[Texture2D]
@export var image_time : float = 2.5

var current_image : int = 0
var num_images : int
var remainingTime : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	num_images = images.size()
	switch_to(0)
	remainingTime = image_time
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	remainingTime -= delta
	if (remainingTime <= 0):
		current_image += 1
		if(current_image>num_images-1):
			current_image = 0
		switch_to(current_image)
		remainingTime = image_time

func switch_to(id : int):
	textureRect.texture = images[id]
