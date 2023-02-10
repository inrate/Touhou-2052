extends KinematicBody2D

var velocity = Vector2 (0, -1)
var speed = 300
var bulletdamage = 5


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	var collision_info = move_and_collide(velocity.normalized() * delta * speed)


	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	if area.name!="bossbullet":
		self.queue_free()
