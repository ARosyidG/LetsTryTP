extends Node2D

func _ready():
	var Player_health = $TestLevel/Player/Control/CanvasLayer/Health
	var health_bar = $TestLevel/Player/Control/CanvasLayer/Health/ProgressBar
	
	Player_health.connect("changed", health_bar, "set_value")
	Player_health.connect("max_changed", health_bar, "set_max")
	Player_health.initialize()
func _input(event):
	if event.is_action_pressed("restart"):
		var _reload = get_tree().reload_current_scene()
