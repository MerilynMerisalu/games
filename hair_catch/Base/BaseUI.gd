class_name base_ui extends Control



var minutes : int = 0;
var seconds : int = 0;
var default_minutes :int = 1;
var default_seconds : int = 30;
var hair_left : int = 15;
var initial_hair_left : int = 15;



@onready var game_timer_label : Label = get_node("GameTimerBoxContainer/GameTimerLabel")
@onready var hair_left_label : Label = get_node("HairLeftBoxContainer/HairLeftLabel");
@onready var game_timer : Timer = get_node("../GameTimer");
@onready var ticking : AudioStreamPlayer = get_node("../Ticking");



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_on_refresh_game_timer_label();
	_on_refresh_score_label();
	_on_refresh_hair_label();
	EventBus.start_label_finished.connect(_on_game_timer_timeout);
	EventBus.hair_caught.connect(_on_hair_caught);
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_refresh_game_timer_label() -> void:
	if(EventBus.is_level_passed == true):
		if (default_seconds == 0):
			if (default_minutes > 0):
				default_minutes -= 1;
				default_seconds -= 10; 
		else :
			default_seconds -= 10;
	
	_reset_timer();
	game_timer_label.text = str(default_minutes) \
		+ ":" + str(default_seconds);
	
	
	
func _reset_timer() -> void:
	minutes = default_minutes;
	seconds = default_seconds;


func on_hair_left_changed(_hair_left: int) -> void:
		hair_left_label.text = str(hair_left) \
			+ EventBus.HAIR_LEFT;
		

func _on_game_timer_timeout() -> void:
	if(seconds == 0):
		if(minutes > 0):
			minutes -= 1;
			seconds = 59;
	else:
		seconds -= 1;
	if(minutes == 0 and seconds <= 10):
		$"GameTimerBoxContainer/GameTimerLabel"\
			.add_theme_color_override("font_color"
			, Color.RED);
		ticking.play();
	if(minutes == 0 and seconds == 0):
		emit_game_over();
		game_timer.stop();
		ticking.stop();
		
	game_timer_label.text = str(minutes) + ":" \
		+ str(seconds);


func _on_hair_caught():
	print(EventBus.score)
	if hair_left > 1:
		hair_left -= 1;
		EventBus.score += 5;
		print(EventBus.score)
		hair_left_label.text = str(hair_left) \
			+ EventBus.HAIR_LEFT;
		$"ScoreBoxContainer/ScoreLabel"\
			.text = str(EventBus.score);
		print(EventBus.score)
	else:
		EventBus.score += 5;
		$"ScoreBoxContainer/ScoreLabel"\
			.text = str(EventBus.score);
		EventBus.is_level_passed = true;
		EventBus.level_up.emit();
		game_timer.stop();
		_on_refresh_hair_label();
		
		
	
func _on_refresh_hair_label() -> void:
	if (EventBus.is_level_passed == true):
		initial_hair_left -= 5;
		$"HairLeftBoxContainer/HairLeftLabel"\
			.text = str(initial_hair_left) +\
		 		EventBus.HAIR_LEFT; 
	else:
		$"HairLeftBoxContainer/HairLeftLabel".text = str(initial_hair_left) + \
				EventBus.HAIR_LEFT; 


func _on_refresh_score_label() -> void:
	$"ScoreBoxContainer/ScoreLabel"\
		.text = str(EventBus.score);

func emit_game_over() -> void:
	if game_timer.is_stopped() == true:
		if (minutes == 0 and seconds == 0) \
			and hair_left > 0:
				EventBus.lose.emit();
				
				
				

		



