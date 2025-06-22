class_name Dead extends State

var animation: AnimationPlayer
var gravity = 600

func enter() -> void:
	$DeadFsx.play()
	animation = owner.get_node(^"AnimationPlayer")
	animation.play("dead")
	Events.game_over.emit()

func process_physics(delta: float) -> void:
	owner.velocity.x = 0.0
	owner.velocity.y = clamp((owner.velocity.y + gravity * delta), -400, 250)
