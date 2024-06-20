class_name base_level extends Node


const LOSE_SCENE : PackedScene = preload("res://Loss/Loss.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func game_over() -> void:
	if EventBus.is_start_label_finished == true:
		await get_tree().create_timer(5.0).timeout;
		if $BaseUI.hair_left > 0 and ($BaseUI.minutes == 0 and
			 $BaseUI.seconds == 0):
			get_tree().call_deferred("change_scene_to_file", "res://Loss/Loss.tscn")
		
	



