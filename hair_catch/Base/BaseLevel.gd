extends Node



@onready var start_label : Label = get_node("LevelContainer/StartTimerContainer/StartLabel")


# Called when the node enters the scene tree for the first time.
func _ready():
	$LevelContainer/StartTimerContainer/StartLabel.visible = false;
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN);
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
		Screen.change_window_mode();
		
	

func _on_link_button_pressed() -> void:
	OS.shell_open("https://www.zapsplat.com/");





	
