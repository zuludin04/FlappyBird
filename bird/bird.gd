class_name Bird extends CharacterBody2D

var gravity = 600

@onready var state_machine: StateMachine = $StateMachine

#func _physics_process(delta: float) -> void:
	#velocity.x = 200
	#
	#velocity.y = clamp((velocity.y + gravity * delta), -400, 250)
	#
	#move_and_slide()
#
#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("flap"):
		#velocity.y = -230.0

func _physics_process(delta: float) -> void:
	self.global_position.y = clamp(self.global_position.y, 10, 300)
	move_and_slide()
