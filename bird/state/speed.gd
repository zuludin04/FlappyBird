class_name Speed extends State

var animation_player: AnimationPlayer

func enter() -> void:
	$Timer.start()
	animation_player = owner.get_node(^"AnimationPlayer")
	animation_player.play("idle")

func process_physics(delta: float) -> void:
	owner.velocity.x = 400
	owner.velocity.y = 0

func _on_timer_timeout() -> void:
	transitioned.emit(self, "flap")
