class_name State extends Node

# signal to change state
signal transitioned(state: State, state_name: String)

# handle what happens initially when a state active
func enter() -> void:
	pass

# clean up state to reinitialize later
func exit() -> void:
	pass

# handle what happens in _update
func process_frame(delta: float) -> void:
	pass

# handle what happens in _update_physics
func process_physics(delta: float) -> void:
	pass

# handle player input
func input_handler(event: InputEvent) -> void:
	pass
