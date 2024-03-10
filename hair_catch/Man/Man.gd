extends RigidBody2D


const CRY_IMG : Texture = preload("res://assets/characters/man/cry.png");
var screen_size;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = Screen.screen_size;
	position.x = randf_range(0, Screen.screen_size.x - Screen.SCREEN_CONSTRAINT )
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass




func _on_body_entered(_body: Node) -> void:
	$"Sprite2D".texture = CRY_IMG;
	$Pain.play();
	EventBus.hair_caught.emit();



