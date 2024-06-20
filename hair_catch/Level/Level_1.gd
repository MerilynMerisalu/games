extends base_level

const MAN_SCENE : PackedScene = preload("res://Characters/Man/Man.tscn");
var is_checking : bool = false;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventBus.score = 0;
	EventBus.level_up.connect(_on_stop_create_man );
	EventBus.start_label_finished.connect(_on_create_man_timer_timeout);
	EventBus.level_up.connect(_on_change_level );
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	super.game_over()


func _on_create_man_timer_timeout() -> void:
	EventBus.is_creating_men = true;
	if EventBus.is_creating_men == true:
		var man = MAN_SCENE.instantiate();
		$Men.call_deferred("add_child", man);


func _on_stop_create_man() -> void:
	EventBus.is_creating_men = false;
	is_checking = true;

func _on_change_level() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://Level/level_2.tscn" )




