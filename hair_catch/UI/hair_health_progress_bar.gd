extends ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	value = 100;
	visible = false;
	EventBus.man_position.connect(_on_set_life_bar_position);
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("pull")):
		value -= 3 * 10;
		value_changed.emit(value);
		$LongPain.play();
		if(value == 0):
			EventBus.hair_caught.emit();



func _on_set_life_bar_position(man_position : Vector2) -> void:
	position = man_position;
	position.y += 50;
	visible = true;
	



