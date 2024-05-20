extends Node

const MAN_SCENE : PackedScene = preload("res://Characters/Man2/Man.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventBus.start_label_finished.connect(_on_create_man_timer_timeout)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_create_man_timer_timeout() -> void:
	var man = MAN_SCENE.instantiate();
	$Men.add_child(man);
