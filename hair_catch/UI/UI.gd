extends base_ui


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventBus.level_up.connect(_on_life_show);
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_life_show() -> void:
	$LifeTextureRect.visible = true
