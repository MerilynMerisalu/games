class_name base_level extends Node


@onready var timer : Timer = get_node("CreateManTimer")
@onready var level_label : Label = get_node("LevelContainer/Level");
@onready var game_timer_label : Label = get_node("BaseUI/GameTimerBoxContainer/GameTimerLabel");



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_label.show(); 
	
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass



	






