extends Node

const MAN_SCENE : PackedScene = preload("res://Man/Man.tscn");
var is_creating_men : bool = true;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventBus.connect("start_label_finished", _on_create_man);
	EventBus.connect("level_up", _on_stop_create_man );


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_create_man() -> void:
		if is_creating_men == true:
			var man = MAN_SCENE.instantiate();
			$Men.call_deferred("add_child", man);



func _on_stop_create_man() -> void:
	is_creating_men = false;
