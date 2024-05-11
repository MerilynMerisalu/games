extends Area2D

const CHANGED_BY : int = 530
var has_timer_started : bool = false;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = randf_range(0, Screen.screen_size.y);
	position.y = Screen.screen_size.y;
	
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if($VisibleOnScreenNotifier2D.is_on_screen() == false \
	 and has_timer_started == false):
		position.y -= CHANGED_BY;
		




func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	$VisibilityTimer.start()
	


func _on_visibility_timer_timeout() -> void:
	position.y += CHANGED_BY;
	has_timer_started = true;
