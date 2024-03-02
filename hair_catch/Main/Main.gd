extends Node


const MAN_SCENE : PackedScene = preload("res://Man/Man.tscn");
@onready var GAMETIMER : Timer = get_node("GameTimer");
@onready var COUNTING: AudioStreamPlayer = get_node("LevelContainer/Counting");
var default_minutes :int = 1;
var default_seconds : int = 31;
var minutes = 0;
var seconds = 0;
var hair_left : int = 5;

# Called when the node enters the scene tree for the first time.
func _ready():
	$LevelContainer/StartTimerContainer/StartLabel.visible = false;
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN);
	_reset_timer()
	$ColorRect/UI/TimerContainer/GameTimerLabel.modulate = Color.BLACK;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
		Screen.change_window_mode();
		
	
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
		$ColorRect/UI/TimerContainer/GameTimerLabel.modulate = Color.RED;
	if (minutes == 0 and seconds == 0 ):
		$GameTimer.stop();
		$Ticking.stop();
	$ColorRect/UI/TimerContainer/GameTimerLabel.text = str(minutes) + ":" + str(seconds);
		


func _on_link_button_pressed() -> void:
	OS.shell_open("https://www.zapsplat.com/");
	
func _on_create_men_timer_timeout() -> void:
	if (COUNTING.finished) or (minutes != 0 and seconds != 0) or (hair_left > 0):
		var man = MAN_SCENE.instantiate();
		$Men.add_child(man);
	
