extends PlayerBaseState

var jump_sp = -400;
var var_jump_height

func enter():
	play("jump")
	object.velocity.y = jump_sp
	object.velocity.x += input.x * Player.MAX_SPEED
	var_jump_height = false
	input.jump_buffer = false
	
	
func physics_update(delta):
	move(delta, true)
	
	if not var_jump_height and not input.jump_pressed:
		var_jump_height = true
		if object.velocity.y <= 0:
			object.velocity.y /= 2
	
	if object.velocity.y >= 0:
		change_state("fall")
