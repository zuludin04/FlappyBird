extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var score: Label = $Score
@onready var game_over: Control = $GameOver
@onready var restart_button: Button = $GameOver/RestartButton

var current_score: int = 0

func _ready() -> void:
	score.text = str(current_score)
	Events.hide_startup.connect(_on_hide_startup)
	Events.track_score.connect(_on_track_score)
	Events.game_over.connect(_on_game_over)
	restart_button.pressed.connect(_on_restart_game)

func _on_hide_startup() -> void:
	animation_player.play("hide_startup")

func _on_track_score() -> void:
	if current_score == 0:
		score.visible = true
	
	current_score += 1
	score.text = str(current_score)

func _on_game_over() -> void:
	$GameOver/HBoxContainer/Label2.text = str(current_score)
	game_over.visible = true

func _on_restart_game() -> void:
	current_score = 0
	get_tree().reload_current_scene()
