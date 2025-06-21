extends Node2D

@onready var obstacles = %Obstacles
@onready var timer: Timer = $Timer

var offset = 20
var obstacle_scene = preload("res://obstacle/obstacle.tscn")

func _ready() -> void:
	Events.start_game.connect(_on_start_game)

func _process(delta: float) -> void:
	self.global_position.y = 60

func spawn_obstacle() -> void:
	var modified_offset = (randi() % offset) - (offset / 2)
	var obstacle = obstacle_scene.instantiate() as Node2D
	obstacle.global_position = Vector2(self.global_position.x + 500, self.global_position.y + modified_offset)
	obstacles.add_child(obstacle)

func _on_timer_timeout() -> void:
	spawn_obstacle()

func _on_start_game() -> void:
	timer.start()
