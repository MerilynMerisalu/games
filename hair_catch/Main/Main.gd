extends Node

const MAN_SCENE : PackedScene = preload("res://Man/Man.tscn");
@onready var start_label : Label = get_node("LevelContainer/StartTimerContainer/StartLabel")
var can_rain_men : bool = false;
@onready var timer : Timer = $CreateManTimer
# Called when the node enters the scene tree for the first time.
func _ready():
	
	$LevelContainer/StartTimerContainer/StartLabel.visible = false;
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN);
	$LevelContainer.connect("start_label_finished", _on_create_man);
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
		Screen.change_window_mode();
		
	
	

func _on_link_button_pressed() -> void:
	OS.shell_open("https://www.zapsplat.com/");
	



func _on_create_man() -> void:
		var man = MAN_SCENE.instantiate();
		$Men.add_child(man)
