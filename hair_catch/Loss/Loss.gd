extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);
	$FinalScoreLabel.text = "Your score: " + str(EventBus.score);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_replay_button_pressed() -> void:
		reset_value();
		get_tree().\
		change_scene_to_file("res://Level/Level_1.tscn");


func reset_value() -> void:
	EventBus.score = 0;
	EventBus.level = 1;

