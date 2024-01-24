extends Control
var time_left : int
var total_time_minutes: int = 130; 


func _ready() -> void:
	reset_timer(total_time_minutes)
func _on_timer_timeout() -> void:
	pass # Replace with function body.

func reset_timer(total_time: int) -> void:
	var converted_time = time_converter(total_time)
	var minutes = converted_time[0];
	var seconds = converted_time[1];
	if(seconds == 0):
		$Label.text = str(minutes) + ":" + str(seconds) + "0";
	else: 
		$Label.text = str(minutes) + ":" + str(seconds); 
	time_left = total_time

func time_converter(total_time: int)-> Array:
	var time_left_minutes = (total_time / 60);
	var time_left_seconds = (total_time % 60);
	var converted_time_parts : Array = [time_left_minutes, time_left_seconds];
	return converted_time_parts;
