extends Node

var screen_size: Vector2;
var window_mode;
const SCREEN_CONSTRAINT : int = 55;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_window().size;
	window_mode = get_window().mode;
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
