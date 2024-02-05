extends Node

var screen_size: Vector2;
var window_mode;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_window().size
	#print(screen_size);
	window_mode = get_window().mode
	#print(window_mode);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
