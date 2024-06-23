extends base_ui


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if EventBus.level == 1:
		$LifeTextureRect.visible = false;
		
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass



