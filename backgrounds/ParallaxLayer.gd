extends ParallaxLayer

export(float) var Back_speed = 50.0

func _process(delta):
	self.motion_offset.y += Back_speed * delta 
