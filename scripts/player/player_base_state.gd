extends state
class_name PlayerBaseState

func play(animation):
	object.sprite.play(animation)
	
func accelerate(delta, direction = object.get_input_x()):
	var mult = Player.AIR_MULTIPLIER if not object.is_on_floor() else 1.0
	object.velocity.x = move_toward(object.velocity.x, Player.MAX_SPEED*direction, Player.ACCELERATION*delta*mult)
	
func apply_gravity(delta):
	var g = Player.JUMP_GRAVITY if fsm.current_state == "jump" else Player.FALL_GRAVITY
	object.velocity.y = move_toward(object.velocity.y, Player.TERMINAL_VELOCITY, g*delta)
	
func move(delta, apply_g, update_direction = true, direction = object.get_input_x()):
	accelerate(delta, direction)
	if apply_g: apply_gravity(delta)
	if update_direction: object.direction = direction
	object.move_and_slide()
