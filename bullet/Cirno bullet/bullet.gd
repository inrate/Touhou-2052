extends Node2D

const speed = 700

func _process(delta):
	position += transform.x * speed * delta


func _on_kill_timer_timeout():
	queue_free() 



func _on_Area2D_area_entered(area):
	if area.name != "bossbullet":
		if area.name != "boss2d":
			if area.name!="MCbullet2d":
				self.queue_free()
				if area.name!="Area2D":
					print(area.name)
