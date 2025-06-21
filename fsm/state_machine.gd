class_name StateMachine extends Node

@export var initial_state: State

var active_state: State
var states: Dictionary = {}

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.transitioned.connect(_on_child_transition)
	
	if initial_state:
		initial_state.enter()
		active_state = initial_state

func _process(delta: float) -> void:
	if active_state: active_state.process_frame(delta)

func _physics_process(delta: float) -> void:
	if active_state: active_state.process_physics(delta)

func _input(event: InputEvent) -> void:
	active_state.input_handler(event)

func _on_child_transition(state: State, state_name: String) -> void:
	if state != active_state:
		return
	
	var new_state = states.get(state_name.to_lower())
	if !new_state:
		return
	
	if active_state:
		active_state.exit()
	
	new_state.enter()
	
	active_state = new_state
