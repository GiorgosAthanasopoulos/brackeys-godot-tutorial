extends Node2D

const SPEED = 60

var direction = 1

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D

@onready var ray_cast_up = $RayCastUp
@onready var timer = $Timer
@onready var death_sound = $DeathSound

func _process(delta):
	if ray_cast_up.is_colliding():
		# TODO: disable killzone to avoid killing player after slime has dies
		visible = false
		death_sound.play()
		timer.start()
		return
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
		
	position.x += direction * SPEED * delta

func _on_timer_timeout():
	queue_free()
