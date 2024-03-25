extends Node

var score : int = 0;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);
	$ScoreLabel.text = "Your score: " + str(EventBus.score);
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_replay_button_pressed() -> void:
	EventBus.score = 0;
	get_tree().change_scene_to_file("res://Main/Main.tscn");
