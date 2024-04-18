extends BaseLevel

const MAN_SCENE : PackedScene = preload("res://Man2/Man.tscn");
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_on_create_men()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_create_men() -> void:
	var man = MAN_SCENE.instantiate();
	$Men.add_child(man);



