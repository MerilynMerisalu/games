extends BoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Level.visible = true;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_level_timer_timeout() -> void:
	$Level.visible = false;
	$StartTimerContainer/StartLabel.visible = true;
	$StartTimerContainer/StartTimer.start();
	$Counting.play();


