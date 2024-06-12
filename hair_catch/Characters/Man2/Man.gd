extends Area2D



const UPPER_BOUNDARY : int = 550;
const MOVE_AMOUNT : int = 10;
const MAN_CRY_IMG : Texture = preload("res://assets/characters/man/cry.png");
const MAN_HAIRLESS_IMG : Texture = preload("res://assets/characters/man/hairless.png")
const IMAGES : Array = [MAN_CRY_IMG, MAN_HAIRLESS_IMG];

var collided : bool = false;
var has_appeared : bool = false;
var is_up : bool = false;
var is_down : bool = true;
var can_interact : bool = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = randf_range(0, Screen.screen_size.x);
	position.y = Screen.screen_size.y;
	$HairHealthProgressBar.visible = false;
	EventBus.change_man_sprite.connect(_on_man_sprite_man_change);
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if(has_appeared == false):
		if(position.y > (Screen.screen_size.y - UPPER_BOUNDARY)):
			position.y -= MOVE_AMOUNT;
		else:
			is_up = true;
			await get_tree().create_timer(3.0).timeout;
			has_appeared = true;
			if(is_up == true and collided == false):
				if(position.y < Screen.screen_size.y):
					position.y += MOVE_AMOUNT;
			
				
				
				


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	if(has_appeared == true):
		queue_free();
			


	

func _on_man_sprite_man_change() -> void:
	if(EventBus.is_hair_pulled == true): 
		$Sprite2D.texture = IMAGES.pick_random();
		collided = false;
		$HairHealthProgressBar.visible = false;
	


func _on_area_entered(area: Area2D) -> void:
	if(area.name == "HitBox"):
		$HairHealthProgressBar.visible = true;
		can_interact = true


func _on_area_exited(area: Area2D) -> void:
	if(area.name == "HitBox"):
		$HairHealthProgressBar.visible = false;
		can_interact = false;
		
func _input(event):
	if(event.is_action_pressed("pull") and can_interact == true):
		$HairHealthProgressBar._on_pull_hair();
		$HairHealthProgressBar/LongPain.play()



