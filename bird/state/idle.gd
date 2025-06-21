class_name Idle extends State

var animation_player: AnimationPlayer

func enter() -> void:
	animation_player = owner.get_node(^"AnimationPlayer")
	animation_player.play("idle")

func process_physics(delta: float) -> void:
	owner.velocity.x = 200

func input_handler(event: InputEvent) -> void:
	if event.is_action_pressed("flap"):
		Events.start_game.emit()
		Events.hide_startup.emit()
		self.transitioned.emit(self, "flap")
