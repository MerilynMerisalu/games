extends Area2D

@onready var visibity_timer : Timer = get_node("VisibilityTimer")
var screen_size;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = Screen.screen_size;
	position.x = randi_range(0, screen_size.x)
	position.y = screen_size.y + 77;
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
 
	if(visibity_timer.is_stopped() == false):
		if(position.y >= screen_size.y / 0.9):
			position.y -= 10;
	else:
		position.y += 10;


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free();


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	$VisibilityTimer.start();
