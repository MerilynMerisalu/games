extends CharacterBody2D

signal hit;
var can_move: bool = false;
var timer_delay : float = 0.1;
func _ready() -> void:
	position = Vector2(137, 429);
	EventBus.bird_can_move.connect(move);
	
	
func _input(event: InputEvent) -> void:
	if(can_move == true):
		if (event is InputEventMouseMotion):
			$AnimatedSprite2D.play("fly")
			position = get_global_mouse_position()
			$AnimationTimer.stop()
			$AnimationTimer.start(timer_delay)
		$AnimationTimer.start();
		

func move() -> void:
	can_move = true;
	if(EventBus.is_level_passed == true):
		can_move = false;
		EventBus.bird_can_move.disconnect(move);
		_ready();
		if(EventBus.is_start_label_finished == true):
			EventBus.is_level_passed = false;
		

func _on_animation_timer_timeout() -> void:
	$AnimatedSprite2D.stop();
