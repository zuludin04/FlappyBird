class_name Obstacle extends Node2D

@onready var mail: Node2D = $Mail

var show_mail: bool

func _ready() -> void:
	mail.visible = show_mail

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Bird:
		if mail.visible:
			Events.track_score.emit()
		mail.visible = false
