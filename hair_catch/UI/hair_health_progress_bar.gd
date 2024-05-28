extends ProgressBar



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	value = 100;
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("pull")):
		value -= 3 * 10;
		value_changed.emit(value);
		$LongPain.play();
		if(value == 0):
			EventBus.hair_caught.emit();
			visible = false;
			EventBus.change_man_sprite.emit();
			EventBus.queue_free_man.emit();
			_on_recharge_life();


func _on_recharge_life() -> void:
	value = 100;
	value_changed.emit(value);



	




