extends Node2D

const speed = 700

func _process(delta):
	position += transform.x * speed * delta


func _on_kill_timer_timeout():
	queue_free() 
