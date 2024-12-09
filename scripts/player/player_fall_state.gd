extends PlayerBaseState

@onready var coyote_timer = $CoyoteTimer

func enter():
	play("fall")
	if fsm.previous_state != "jump":
		coyote_timer.start()

func physics_update(delta):
	move(delta, true)

	if object.is_jump_just_pressed() and coyote_timer.time_left > 0:
		coyote_timer.stop() 
		change_state("jump")
	elif object.is_on_floor():
		coyote_timer.stop()  
		if object.get_input_x() == 0:
			change_state("idle")
		else:
			change_state("run")
