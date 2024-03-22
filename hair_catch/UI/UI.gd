extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventBus.hair_left_label_refresed.connect(on_hair_left_changed);
	EventBus.game_timer_label_refresed.connect(_on_game_timer_label_refreshed);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func on_hair_left_changed(hair_left:int) -> void:
		$HairContainer/HairLeftLabel.text = str(hair_left) \
		+ EventBus.HAIR_LEFT;

func _on_game_timer_label_refreshed(minutes : int, seconds: int):
	$"TimerContainer/GameTimerLabel".text = str(minutes) + ":" + str(seconds);
