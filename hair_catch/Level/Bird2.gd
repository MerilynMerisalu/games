extends Area2D

var men_in_area: Array[Area2D] = []

func _ready():
	area_entered.connect(func(man: Area2D):
		men_in_area.append(man)
	)
	area_exited.connect(func(man: Area2D):
		men_in_area.erase(man)
	)

func _input(event: InputEvent):
	if event.is_action_pressed("pull"):
		for man in men_in_area:
			man.hurt()
