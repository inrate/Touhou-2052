extends KinematicBody2D

var velocity = Vector2()
export var direction = -1

const bullet_scene = preload("res://bullet/Cirno bullet/bullet.tscn")
onready var shoot_timer = $ShootTimer
onready var rotater = $Rotater

const rotate_speed = -20
const shooter_timer_wait_time = 0.2
const spawn_point_count = 12
const radius = 50

var health = 100
signal bosshealthchange(new_health)


func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true
	var step = 2 * PI / spawn_point_count
	
	for i in range(spawn_point_count):
		var spawn_point = Node2D.new()
		var pos = Vector2(radius, 0).rotated(step * i)
		spawn_point.position = pos
		spawn_point.rotation = pos.angle()
		rotater.add_child(spawn_point)
		
	shoot_timer.wait_time = shooter_timer_wait_time
	shoot_timer.start()
	
	
# warning-ignore:unused_argument
func _physics_process(delta):
	
	if is_on_wall():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
	
	velocity.x = 50 * direction
	
	
	
func _process(delta: float) -> void:
	var new_rotation = rotater.rotation_degrees + rotate_speed * delta
	rotater.rotation_degrees = fmod(new_rotation, 360)
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
func _on_ShootTimer_timeout() -> void:
	if health > 0:
		for s in rotater.get_children():
			var bullet = bullet_scene.instance()
			get_tree().root.add_child(bullet)
			bullet.position = s.global_position
			bullet.rotation = s.global_rotation
		
func take_dmg(amount):
	health-=amount
	if health < 0:
		health = 0
	emit_signal("bosshealthchange", health)
		
		


func _on_Area2D_area_entered(area):
	if area.name!="bossbullet":
		take_dmg(5)
	
