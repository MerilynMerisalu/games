extends  CharacterBody2D

var can_move : bool;
func _ready() -> void:
	position = Vector2(137, 429);
	can_move = false;
# Should be executed with signals
func _input(event: InputEvent) -> void:
	if (can_move == true):
		if event is InputEventMouseMotion:
			position = get_global_mouse_position();
		


func _on_moving_timer_timeout() -> void:
	can_move = true;
