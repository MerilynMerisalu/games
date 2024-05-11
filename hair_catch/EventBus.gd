extends Node



signal hair_caught;
signal create_man;
signal bird_can_move;
signal level_up(level : int);
signal hair_left_label_refresed(hair_left : int);
signal game_timer_label_refresed(minutes : int, seconds : int);
signal start_label_finished;
signal lose;




const HAIR_LEFT : String = " Hair Left";

var is_creating_men : bool = true;
var is_level_passed : bool = false;
var score : int = 0;
var is_start_label_finished : bool = false;
var health : int = 30;
var damage : int = 0;
var level : int = 1;
var reset_values : bool = false;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventBus.lose.connect(game_over);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func game_over() -> void:
	get_tree().change_scene_to_file("res://Loss/Loss.tscn");
	
		





