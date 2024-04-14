extends Area2D

var screen_size: Vector2 = Vector2();
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = Screen.screen_size;
	position.y = screen_size.y;
		
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
