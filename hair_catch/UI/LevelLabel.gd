class_name level_base extends BoxContainer


signal change_hair_count(hair_left: int);
@onready var start_label : Label = get_node("StartTimerContainer/StartLabel")






var level : int = 1;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_label.visible = false;
	
	_on_display_level_changed();
	
	EventBus.connect("level_up", _on_level_changed);
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	

func _on_level_timer_timeout() -> void:
	$Level.visible = false;
	$StartTimerContainer/StartLabel.visible = true;
	$StartTimerContainer/StartTimer.start();
	$Counting.play();


func _on_start_timer_container_label_hidden() -> void:
	EventBus.start_label_finished.emit();
	EventBus.is_start_label_finished = true
	
	
func _on_display_level_changed() -> void:
	$Level.visible = true;
	$LevelMusic.play();
	$Level.text = "Level " + str(level);
	$LevelTimer.start();
	

func _on_level_changed() -> void:
		level += 1;
		_on_display_level_changed();
		
		


