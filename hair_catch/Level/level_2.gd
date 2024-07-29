extends base_level


const MAX_NUM_MEN_ON_THE_SCREEN : int = 2;
const TIMER_DURATION : float = .4;
const MAN_SCENE : PackedScene = preload("res://Characters/Man2/Man.tscn")
const ASTEROID_SCENE : PackedScene = \
	preload("res://Characters/Enemies/asteroid/asteroid.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventBus.start_label_finished.connect(_on_create_man_timer_timeout)
	#EventBus.start_label_finished.connect(_on_create_asteroid_timer_timeout)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	super.game_over();
	


func _on_create_man_timer_timeout() -> void:
	
	var man = MAN_SCENE.instantiate();
	if($Men.get_child_count() >= MAX_NUM_MEN_ON_THE_SCREEN):
		await get_tree().create_timer(TIMER_DURATION).timeout;
		$Men.add_child(man);
	else:
		$Men.add_child(man);



func _on_create_asteroid_timer_timeout() -> void:
	if($GameTimer.is_stopped() == true):
		var pause_time : float = randf_range(5.0, 30);
		var asteroid = ASTEROID_SCENE.instantiate();
		$Asteroids.add_child(asteroid);
		$CreateAsteroidTimer.wait_time = pause_time;

		



