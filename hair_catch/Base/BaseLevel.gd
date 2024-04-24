class_name base_level extends Node

@onready var start_label : Label = get_node("LevelContainer/StartTimerContainer/StartLabel")
@onready var hair_left_label : Label = get_node("BaseUi/HairContainer/HairLeftLabel");
@onready var game_timer_label : Label = get_node("BaseUi/TimerContainer/GameTimerLabel");
@onready var score_label : Label = get_node("BaseUi/ScoreContainer/ScoreLabel");
@onready var game_timer: Timer = get_node("GameTimer")
var is_creating_men : bool = false;

var initial_hair_left : int = 15;
var hair_left : int = 15;
var default_minutes :int = 1;
var default_seconds : int = 31;
var minutes : int = 0;
var seconds : int = 0;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	game_timer_label.modulate = Color.BLACK;
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN);
	EventBus.connect("start_label_finished", _on_create_man);
	EventBus.connect("level_up", _on_stop_create_man )
	EventBus.connect("hair_caught", _on_hair_caught);
	hair_left_label.text = str(hair_left) + EventBus.HAIR_LEFT;
	_reset_timer();
	_on_level_container_start_label_finished();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	Screen.change_window_mode();
	game_over();
	

func _reset_timer() -> void:
	minutes = default_minutes;
	seconds = default_seconds;
	
func _on_create_man(MAN_SCENE: PackedScene) -> void:
		if is_creating_men == true:
			var man = MAN_SCENE.instantiate();
			$Men.call_deferred("add_child", man)

func _on_stop_create_man() -> void:
	is_creating_men = false;

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


func _on_refresh_hair_label() -> void:
	if (EventBus.is_level_passed == true):
		initial_hair_left -= 5;
		EventBus.hair_left_label_refresed.emit(initial_hair_left);
		
func _on_refresh_game_timer_label() -> void:
	if(EventBus.is_level_passed == true):
		if (default_seconds == 0):
			if (default_minutes > 0):
				default_minutes -= 1;
				default_seconds -= 9; 
		else:
			default_seconds -= 9;
			_reset_timer();
			EventBus.game_timer_label_refresed.emit(default_minutes, default_seconds);
			game_timer.start();
			_on_game_timer_timeout();			

func _on_hair_caught():
	if hair_left > 1:
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
				
					
