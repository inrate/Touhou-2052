extends KinematicBody2D

signal health_changed(new_health)

const MAX_SPEED=250
var FM = Sprite
var health = 10

const bulletpath = preload("res://MCbullet.tscn")
#z = shoot
#x = bombe
#shift = slowdown / focusmode
func shoot():
	var MCbullet = bulletpath.instance()
	get_parent().add_child(MCbullet)
	MCbullet.position=Vector2($CollisionShape2D.global_position.x,$CollisionShape2D.global_position.y-40)
	


var velocity = Vector2.ZERO

func _physics_process(delta):
	if Input.is_action_just_pressed("shoot"):
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
	
	
	
	
func take_damage(amount):
	health-=amount
	if health < 0:
		health = 0
	emit_signal("health_changed",health)

func _on_Area2D_area_entered(area):
	take_damage(1)
