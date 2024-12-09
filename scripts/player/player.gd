extends CharacterBody2D
class_name Player

@onready var sprite = $AnimatedSprite2D
@onready var fsm = $FSM

const AIR_MULTIPLIER = 0.7
const MAX_SPEED = 100.0
const ACCELERATION = 900.0

const JUMP_GRAVITY = 1100.0
const FALL_GRAVITY = 700.0
const TERMINAL_VELOCITY = 200.0 

var direction:
	get: return direction
	set(value):
		if value == 0 or value == direction: return
		direction = value
		sprite.flip_h = value == -1
		
func _ready():
	fsm.change_state("idle")

func _physics_process(delta):
	fsm.physics_update(delta)
	
func get_input_x():
	return Input.get_axis("btn_left","btn_right")
	
func is_jump_just_pressed():
	return Input.is_action_just_pressed("btn_jump")
