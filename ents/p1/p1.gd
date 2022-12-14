extends KinematicBody2D

const MAX_SPEED=250
var FM = Sprite

const bulletpath = preload("res://MCbullet.tscn")
#z = shoot
#x = bombe
#shift = slowdown / focusmode
func shoot():
	var MCbullet = bulletpath.instance()
	get_parent().add_child(MCbullet)
	MCbullet.position = Position2D.global_position
	
	
var velocity = Vector2.ZERO


func _physics_process(delta):
	if Input.is_action_just_pressed("ui_select"):
		shoot()
	var input_vector=Vector2.ZERO
	input_vector.x=Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	input_vector.y=Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	
	if input_vector!=Vector2.ZERO:
		velocity=velocity.move_toward(input_vector*MAX_SPEED,MAX_SPEED)
	else:
		velocity=velocity.move_toward(Vector2.ZERO,MAX_SPEED)
	
	velocity=(move_and_slide(velocity)*delta)
