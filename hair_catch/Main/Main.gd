extends Node

const MAN_SCENE : PackedScene = preload("res://Man/Man.tscn");
#const HAIR_LEFT : String = " Hair Left";
@onready var start_label : Label = get_node("LevelContainer/StartTimerContainer/StartLabel")
var default_minutes :int = 0;
var default_seconds : int = 3;
var minutes = 0;
var seconds = 0;
#var hair_left : int = 10;
#var score : int = 0;


# Called when the node enters the scene tree for the first time.
func _ready():
	#EventBus.connect("hair_caught", _on_hair_caught);
	$LevelContainer/StartTimerContainer/StartLabel.visible = false;
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN);
	#$ColorRect/UI/HairContainer/HairLeftLabel.text = str(hair_left) + HAIR_LEFT;
	
	#$ColorRect/UI/TimerContainer/GameTimerLabel.modulate = Color.BLACK;
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
		Screen.change_window_mode();
		#game_over();
		
	

func _on_link_button_pressed() -> void:
	OS.shell_open("https://www.zapsplat.com/");
	


func _on_create_men_timer_timeout() -> void:
	var man = MAN_SCENE.instantiate();
	$Men.add_child(man);

#func _on_level_container_start_label_finished() -> void:
	#if hair_left > 0 and game_timer.is_stopped() == false:
		#_on_create_men_timer_timeout();

#func _on_hair_caught():
	#if hair_left > 0:
		#hair_left -= 1;
		#score += 5;
		#$ColorRect/UI/HairContainer/HairLeftLabel.text = str(hair_left) \
			#+ HAIR_LEFT;
		#$ColorRect/UI/ScoreContainer/Score.text = str(score);


#func game_over() -> void:
	#if(game_timer.is_stopped() == true and hair_left > 0):
		#get_tree().change_scene_to_file("res://Lose/Loss.tscn");
