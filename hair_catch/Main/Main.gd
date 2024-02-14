extends Node
var default_minutes :int = 1;
var default_seconds : int = 31;
var minutes= 0;
var seconds = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN);
	await get_tree().create_timer(.8).timeout
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
	


func _on_start_timer_timeout() -> void:
	$StartTimerContainer/StartLabel.hide();
	
