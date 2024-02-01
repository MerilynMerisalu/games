extends Node
var default_minutes :int = 1;
var default_seconds : int = 31;
var minutes= 0;
var seconds = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	_reset_timer();
	$TimerContainer/GameTimerLabel.modulate = Color.BLACK
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
		_change_window_mode();	
	
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
		$TimerContainer/GameTimerLabel.modulate = Color.RED;
	if (minutes == 0 and seconds == 0 ):
		$GameTimer.stop();
		$Ticking.stop();
	$TimerContainer/GameTimerLabel.text = str(minutes) + ":" + str(seconds);
		


func _on_link_button_pressed() -> void:
	OS.shell_open("https://www.zapsplat.com/");
func _change_window_mode() -> void:
	if Input.is_action_pressed("ui_cancel"):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED);
	elif Input.is_action_pressed("full_screen"):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN);	
