extends Node

@onready var game_timer : Timer = get_node("GameTimer");

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventBus.lose.connect(game_over);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

