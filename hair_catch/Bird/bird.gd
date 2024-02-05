extends CharacterBody2D


func _ready() -> void:
	position = Vector2(137, 429);
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		position = get_global_mouse_position();
		$AnimatedSprite2D.animation = "fly";
		$AnimatedSprite2D.play();
