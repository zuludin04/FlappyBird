extends Node2D

func _on_score_area_body_entered(body: Node2D) -> void:
	if body is Bird:
		Events.track_score.emit()
