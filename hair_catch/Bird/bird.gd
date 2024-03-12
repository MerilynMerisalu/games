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

