extends base_ui

signal all_lives_lost;
const BIRD_LIFE_IMG_1 : Texture = preload("res://assets/images/Lives/one_life_lost_red.png")
const BIRD_LIFE_IMG_2 : Texture = preload("res://assets/images/Lives/two_lives_lost_red.png")
const BIRD_LIFE_IMG_3 : Texture = preload("res://assets/images/Lives/three_lives_lost_red.png")
const BIRD_LIFE_IMG_4 : Texture = preload("res://assets/images/Lives/four_lives_lost_red.png")
const LIVES_IMAGES : Array = [BIRD_LIFE_IMG_1, BIRD_LIFE_IMG_2, BIRD_LIFE_IMG_3, BIRD_LIFE_IMG_4]

var i : int = 0;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if EventBus.level == 1:
		$LifeTextureRect.visible = false;
	EventBus.bird_hit.connect(_on_bird_hit)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_bird_hit() -> void:
	if i >= 4:
		game_timer.paused = true;
	else:	
		$LifeTextureRect.texture = LIVES_IMAGES[i]
		i+= 1
