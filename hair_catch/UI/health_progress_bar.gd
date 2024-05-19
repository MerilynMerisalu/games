extends Node

@onready var health_progress_bar : ProgressBar = get_node("HealthProgressBar")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health_progress_bar.value = 100;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	health_progress_bar.value -= 3 * 10;
	health_progress_bar.value_changed.emit(health_progress_bar.value);



