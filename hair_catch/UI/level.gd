extends BoxContainer

signal start_label_finished;
const HAIR_LEFT : String = " Hair Left";
@onready var game_timer_label : Label = get_node("../UI/TimerContainer/GameTimerLabel")
var level : int = 1
var score : int = 0;
var hair_left : int = 10;
@onready var game_timer: Timer = get_node("GameTimer")
var default_minutes :int = 0;
var default_seconds : int = 15;
var minutes = 0;
var seconds = 0;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game_timer_label.modulate = Color.BLACK;
	_on_level_changed();
	_reset_timer();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_level_timer_timeout() -> void:
	$Level.visible = false;
	$StartTimerContainer/StartLabel.visible = true;
	$StartTimerContainer/StartTimer.start();
	$Counting.play();


func _on_start_timer_container_label_hidden() -> void:
	start_label_finished.emit();


func _on_level_changed() -> void:
	$Level.visible = true;
	$Level.text = "Level " + str(level);
	


func _on_hair_caught():
	if hair_left > 0:
		hair_left -= 1;
		score += 5;
		$ColorRect/UI/HairContainer/HairLeftLabel.text = str(hair_left) \
			+ HAIR_LEFT;
		$ColorRect/UI/ScoreContainer/Score.text = str(score);


func _on_level_container_start_label_finished() -> void:
	if hair_left > 0 and game_timer.is_stopped() == false:
		print("Making progress");
		
		
		
func game_over() -> void:
		if(game_timer.is_stopped() == true and hair_left > 0):
			get_tree().change_scene_to_file("res://Lose/Loss.tscn");
			
			
			
func _reset_timer() -> void:
	minutes = default_minutes;
	seconds = default_seconds;


func _on_game_timer_timeout() -> void:
	if (seconds == 0):
		if (minutes > 0):
			minutes -= 1;
			seconds = 60;
	seconds -= 1;
	if minutes == 0 and seconds <= 10:
		$Ticking.play();
		game_timer_label.modulate = Color.RED;
	if (minutes == 0 and seconds == 0 ):
		$GameTimer.stop();
		$Ticking.stop();
	game_timer_label.text = str(minutes) + ":" + str(seconds);
		


