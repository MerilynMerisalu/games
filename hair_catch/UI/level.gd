extends BoxContainer


signal start_label_finished;
signal change_hair_count(hair_left: int);

@onready var game_timer_label : Label = get_node("../UI/TimerContainer/GameTimerLabel")
@onready var hair_left_label : Label = get_node("../UI/HairContainer/HairLeftLabel");
@onready var score_label : Label = get_node("../UI/ScoreContainer/ScoreLabel");
@onready var game_timer: Timer = get_node("GameTimer")


var level : int = 1;
var hair_left : int = 10;
var default_minutes :int = 1;
var default_seconds : int = 31;
var minutes = 0;
var seconds = 0;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game_timer_label.modulate = Color.BLACK;
	hair_left_label.text = str(hair_left) + EventBus.HAIR_LEFT;
	_on_display_level_changed();
	_reset_timer();
	_on_level_container_start_label_finished()
	EventBus.connect("hair_caught", _on_hair_caught)
	EventBus.connect("level_up", _on_level_changed)
	#EventBus.connect()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	game_over()
	

func _on_level_timer_timeout() -> void:
	$Level.visible = false;
	$StartTimerContainer/StartLabel.visible = true;
	$StartTimerContainer/StartTimer.start();
	$Counting.play();


func _on_start_timer_container_label_hidden() -> void:
	start_label_finished.emit();
	
	
func _on_display_level_changed() -> void:
	$Level.visible = true;
	$LevelMusic.play();
	$Level.text = "Level " + str(level);
	$LevelTimer.start();
	

func _on_hair_caught():
	if hair_left > 0:
		hair_left -= 1;
		EventBus.score += 5;
		hair_left_label.text = str(hair_left) + EventBus.HAIR_LEFT;
		score_label.text = str(EventBus.score);
	else:
		EventBus.level_up.emit();
		game_timer.stop();
		EventBus.is_level_passed = true;
		_on_refresh_hair_label();
		_on_refresh_game_timer_label();
		


func _on_level_container_start_label_finished() -> void:
	if game_timer.is_stopped() == false:
		EventBus.create_man.emit();

func game_over() -> void:
		if (EventBus.is_level_passed == false):
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
		



func _on_level_changed() -> void:
		level += 1;
		_on_display_level_changed();
		
		

func _on_refresh_hair_label() -> void:
	hair_left = 10;
	if (EventBus.is_level_passed == true):
		hair_left += 5;
		EventBus.hair_left_label_refresed.emit(hair_left);
		
func _on_refresh_game_timer_label() -> void:
	if(EventBus.is_level_passed == true):
		if (default_seconds == 0):
			if (default_minutes > 0):
				default_minutes -= 1;
				default_seconds -= 9;
				print(default_minutes, default_seconds) 
		else:
			default_seconds -= 9;
			print(default_seconds)
			_reset_timer();
			EventBus.game_timer_label_refresed.emit(default_minutes, default_seconds);
			game_timer.start();
			_on_game_timer_timeout();			
