extends ParallaxLayer

@export var speed = 30

func _process(delta):
	motion_offset.x -= speed*delta
