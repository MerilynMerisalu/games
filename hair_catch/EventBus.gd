extends Node

signal hair_caught;
signal create_man;
signal bird_can_move;
signal level_up;
signal hair_left_label_refresed(hair_left : int);
signal game_timer_label_refresed(minutes : int, seconds : int);
signal start_label_finished;

const HAIR_LEFT : String = " Hair Left";
var is_level_passed : bool = false;
var score : int = 0;
var is_start_label_finished : bool = false;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
