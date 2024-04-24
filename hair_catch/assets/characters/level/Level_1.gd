extends base_level

const MAN_SCENE : PackedScene = preload("res://Man/Man.tscn");
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	create_men();

func create_men() -> void:
	super._on_create_man(MAN_SCENE);
