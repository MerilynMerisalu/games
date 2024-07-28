extends RigidBody2D


var force : float = randf_range(5.0, 15.0)
var has_collided : bool = false;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = randf_range(0, Screen.screen_size.x);
	position.y = randf_range(-50, 0);
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	position.y += force * gravity_scale * _delta
	


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	call_deferred("queue_free")
	
	


func _on_body_entered(body: Node) -> void:
	if(body.name == "Bird" and has_collided == false):
		$FallingAsteroid.stream_paused = true;
		$AsteroidHit.play();
		EventBus.bird_hit.emit();
		$FallingAsteroid.stream_paused = false;
		has_collided = true;
