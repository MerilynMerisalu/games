extends RigidBody2D

const POSITION_X_START_VALUE : int = 250;
const CRY_IMG : Texture = preload("res://assets/characters/man/cry.png");
var screen_size;
var is_collided: bool = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = Screen.screen_size;
	position.x = randf_range(POSITION_X_START_VALUE,
	 Screen.screen_size.x - Screen.SCREEN_CONSTRAINT )
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


 

func _on_body_entered(body: Node) -> void:
	if(body.name == "Bird" and is_collided == false):
		$"Sprite2D".texture = CRY_IMG;
		$Pain.play();
		EventBus.hair_caught.emit();
		is_collided = true;


