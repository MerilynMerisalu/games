extends Area2D



const UPPER_BOUNDARY : int = 550;
const MOVE_AMOUNT : int = 10;
var has_appeared : bool = false;
var is_up : bool = false;
var is_down : bool = true;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = randf_range(0, Screen.screen_size.x);
	position.y = Screen.screen_size.y;
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if (has_appeared == false):
		if(position.y > (Screen.screen_size.y - UPPER_BOUNDARY)):
			position.y -= MOVE_AMOUNT;
		else:
			is_up = true;
			await get_tree().create_timer(3.0).timeout;
			has_appeared = true;
			if is_up == true:
				if(position.y < Screen.screen_size.y):
					position.y += MOVE_AMOUNT;
				
				


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	if(has_appeared == true):
		queue_free();
