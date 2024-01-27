extends Node

var default_minutes :int = 1;
var default_seconds : int = 30;
var minutes= 0;
var seconds = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	_reset_timer();
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass	
	
func _reset_timer() -> void:
	minutes = default_minutes;
	seconds = default_seconds;


func _on_game_timer_timeout() -> void:
	if (seconds == 0):
		if (minutes > 0):
			minutes -= 1;
			seconds = 60;
	seconds -= 1;
	if (minutes == 0 and (seconds <= 10)):
		$Ticking.play();
	if (minutes == 0 and seconds == 0 ):
		$GameTimer.stop();
		$Ticking.stop();
	$GameTimerLabel.text = str(minutes) + ":" + str(seconds);
		


func _on_link_button_pressed() -> void:
	OS.shell_open("https://www.zapsplat.com/")
