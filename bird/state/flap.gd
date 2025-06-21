class_name Flap extends State

var animation_player: AnimationPlayer
var gravity = 600

func enter() -> void:
	animation_player = owner.get_node(^"AnimationPlayer")
	animation_player.play("flap")
	Events.bird_died.connect(_on_bird_died)

func process_physics(delta: float) -> void:
	owner.velocity.x = 200

	owner.velocity.y = clamp((owner.velocity.y + gravity * delta), -400, 250)

func input_handler(event: InputEvent) -> void:
	if event.is_action_pressed("flap"):
		owner.velocity.y = -230.0

func _on_bird_died() -> void:
	transitioned.emit(self, "dead")
