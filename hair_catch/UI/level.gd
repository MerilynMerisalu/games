extends BoxContainer

signal start_label_finished;

var level : int = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Level.visible = true;
	$Level.text = "Level " + str(level);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_level_timer_timeout() -> void:
	$Level.visible = false;
	$StartTimerContainer/StartLabel.visible = true;
	$StartTimerContainer/StartTimer.start();
	$Counting.play();

func _on_start_timer_container_label_hidden() -> void:
	start_label_finished.emit()
