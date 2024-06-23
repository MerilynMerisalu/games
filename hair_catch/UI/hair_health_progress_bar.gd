extends ProgressBar



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	value = 100;
	EventBus.recharge_hair_health.connect(_on_recharge_hair_health);
	visible = false;
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_recharge_hair_health() -> void:
	value = 100;
	value_changed.emit(value);



func _on_pull_hair() -> void:
	value -= 30;
	if(value == 0):
		EventBus.hair_caught.emit();
