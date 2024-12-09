extends PlayerBaseState

@onready var coyote_timer = $CoyoteTimer

func enter():
	play("fall")
	if fsm.previous_state != "jump":
		coyote_timer.start()

func physics_update(delta):
	move(delta, true)

	if input.jump_just_pressed and coyote_timer.time_left > 0:
		coyote_timer.stop() 
		change_state("jump")
	elif object.is_on_floor():
		if input.jump_buffer:
			change_state("jump")
		coyote_timer.stop()  
		if input.x == 0:
			change_state("idle")
		else:
			change_state("run")
