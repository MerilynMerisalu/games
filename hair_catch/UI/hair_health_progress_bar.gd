extends ProgressBar



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	value = 100;
	EventBus.recharge_hair_health.connect(_on_recharge_hair_health);
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_hair_pull() -> void:
	value -= 3 * 10;
	value_changed.emit(value)
	$LongPain.play();
	if(value == 0):
		EventBus.is_hair_pulled = true
		EventBus.hair_caught.emit();
		visible = false;
		EventBus.change_man_sprite.emit();
		EventBus.is_hair_pulled = false;





func _on_recharge_hair_health() -> void:
	value = 100;
	value_changed.emit(value);



func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("pull"):
		_on_hair_pull()
