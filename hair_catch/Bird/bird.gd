extends CharacterBody2D

signal hit;
var can_move: bool = false;

func _ready() -> void:
	position = Vector2(137, 429);
	EventBus.bird_can_move.connect(move);
	

func _input(event: InputEvent) -> void:
	if(can_move == true):
		if (event is InputEventMouseMotion):
			position = get_global_mouse_position();
		

func move() -> void:
	can_move = true;
	if(EventBus.is_level_passed == true):
		can_move = false;
		EventBus.bird_can_move.disconnect(move);
		_ready();
		if(EventBus.is_start_label_finished == true):
			EventBus.is_level_passed = false;
		


	
