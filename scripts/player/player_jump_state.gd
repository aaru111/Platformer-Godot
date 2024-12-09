extends PlayerBaseState

var jump_sp = -400;

func enter():
	play("jump")
	object.velocity.y = jump_sp
	
func physics_update(delta):
	move(delta, true)
	
	if object.velocity.y >= 0:
		change_state("fall")
