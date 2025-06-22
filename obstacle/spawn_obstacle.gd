extends Node2D

@onready var obstacles = %Obstacles
@onready var timer: Timer = $Timer

var offset = 20
var obstacle_scene = preload("res://obstacle/obstacle.tscn")

var total_obstacle: int = 0

func _ready() -> void:
	Events.start_game.connect(_on_start_game)

func _process(delta: float) -> void:
	self.global_position.y = 60

func spawn_obstacle(show_mail: bool) -> void:
	var modified_offset = (randi() % offset) - (offset / 2)
	var obstacle: Obstacle = obstacle_scene.instantiate() as Node2D
	obstacle.show_mail = show_mail
	obstacle.global_position = Vector2(self.global_position.x + 500, self.global_position.y + modified_offset)
	obstacles.add_child(obstacle)

func _on_timer_timeout() -> void:
	total_obstacle += 1
	spawn_obstacle(total_obstacle % 4 == 0)

func _on_start_game() -> void:
	timer.start()
