extends Node



const MAX_NUM_MEN_ON_THE_SCREEN : int = 1;
const TIMER_DURATION : float = 8.0;
const MAN_SCENE : PackedScene = preload("res://Characters/Man2/Man.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventBus.start_label_finished.connect(_on_create_man_timer_timeout)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_create_man_timer_timeout() -> void:
	var man = MAN_SCENE.instantiate();
	if($Men.get_child_count() >= MAX_NUM_MEN_ON_THE_SCREEN):
		await get_tree().create_timer(TIMER_DURATION).timeout;
		$Men.add_child(man);
	else:
		$Men.add_child(man);





func _on_men_child_exiting_tree(node: Node) -> void:
	$Men.remove_child.call_deferred(node)



