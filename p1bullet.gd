extends Area2D

var velocity = Vector2 (0, -1)
var speed = 300
var bulletdamage = 5
signal dealdamage(deal_damage)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	pass

func _on_area_entered(area):
	emit_signal("dealdamage",bulletdamage)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
