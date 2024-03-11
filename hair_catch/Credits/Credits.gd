extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_soundtrack_link_pressed() -> void:
	OS.shell_open("https://www.zapsplat.com/");


func _on_level_sound_effect_obtained_from_pressed() -> void:
	OS.shell_open("https://www.zapsplat.com/");
	

func _on_start_counter_sound_effect_obtained_from_link_button_pressed() -> void:
	OS.shell_open("https://elements.envato.com/cartoon-character-counting-to-three-fast-2LM2SGJ")


func _on_man_character_sprites_obtained_from_link_button_pressed() -> void:
	OS.shell_open("https://www.freepik.com/");


func _on_pain_sound_effect_obtained_from_link_button_pressed() -> void:
	OS.shell_open("https://www.zapsplat.com/");
