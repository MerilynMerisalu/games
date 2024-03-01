extends RigidBody2D

var screen_size;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = Screen.screen_size;
	position.x = randf_range(0, Screen.screen_size.x - Screen.SCREEN_CONSTRAINT )


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
