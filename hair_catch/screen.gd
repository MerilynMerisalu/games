extends Node

var screen_size: Vector2;
var window_mode;
var play_area_size;
const SCREEN_CONSTRAINT : float = 55.0;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_window().size;
	window_mode = get_window().mode;
	play_area_size = get_viewport().get_visible_rect().size;
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	change_window_mode()
	
func change_window_mode() -> void:
	if Input.is_action_pressed("ui_cancel"):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED);
	elif Input.is_action_pressed("full_screen"):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN);	
