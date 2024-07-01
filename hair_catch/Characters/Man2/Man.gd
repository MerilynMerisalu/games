extends Area2D

const UPPER_BOUNDARY : int = 550
#this can be thought of as 100 pixels a second when it is multiplied 
#by the delta time in the process function
const MOVE_AMOUNT : int = 450

const MAN_CRY_IMG : Texture = preload("res://assets/characters/man/cry.png");
const MAN_HAIRLESS_IMG : Texture = preload("res://assets/characters/man/hairless.png");
const IMAGES : Array = [MAN_CRY_IMG, MAN_HAIRLESS_IMG];

#this represents how long the man stays up
const HANG_TIME : float = 5.0;
 
var collided : bool = false;
var has_appeared : bool = false;

#this is a float variable to keep track of how long the man has been up
var elapsed_time : float = 0;


# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	position.x = randf_range(0, Screen.screen_size.x);
	position.y = Screen.screen_size.y;
	$HairHealthProgressBar.visible = false;
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_on_man_movement(delta)
	
	
func _on_man_movement(delta) -> void:
	#This handles the man rising up and entering the screen,
	#once he enters the screen
	#this chunk of code will no longer be executed because 
	#the has_appeared flag will have been set to true
	if(has_appeared == false):
		position.y -= MOVE_AMOUNT;
		if(position.y > (Screen.screen_size.y - UPPER_BOUNDARY)):
			position.y = (Screen.screen_size.y - UPPER_BOUNDARY);
			has_appeared = true;
		return;
	#This chunk of code handles the the hang time of the man, where he waits on the screen until the elapsed_time is
	#greater than or equal to the HANG_TIME constant
	if(elapsed_time < HANG_TIME):
		elapsed_time += delta;
		return
	#This bit of code handles moving the man back down until he is off the screen.
	#due to the return statement in the above chunk of code handling the elapsed time, the man will not move down until the time has fully elapsed
	#He will move down until he exits the screen at which point the _on_visible_on_screen_notifier_2d_screen_exited will
	#be called to remove him from the Scene Tree
	position.y += MOVE_AMOUNT * delta;



func _on_area_entered(area: Area2D) -> void:
	if (area.name == "HitBox"):
		$HairHealthProgressBar.visible = true;
		collided = true;


func _on_area_exited(area: Area2D) -> void:
	if(area.name == "HitBox"):
		$HairHealthProgressBar.visible = false;
		collided = false;
		
		
func _input(_event: InputEvent) -> void:
	if(Input.is_action_just_pressed("pull") 
		and collided == true):
			#if the man is dead, ignore the input
			if($HairHealthProgressBar.value <= 0):
				return;
			#the man is not dead, pluck out his hair
			$HairHealthProgressBar._on_pull_hair();
			$HairHealthProgressBar/LongPain.play();
			if($HairHealthProgressBar.value <= 0):
				$Sprite2D.texture = IMAGES.pick_random();


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free();
 	
