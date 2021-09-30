extends KinematicBody2D
onready var TPArea = get_node("TPArea")
var YES = preload("res://assets/TP_not.png")
var NOT = preload("res://assets/TP.png")
onready var is_tileMap : bool = false
func _ready():
	pass
func _process(_delta):
	if is_tileMap:
		var TP = get_node("TP")
		TP.set_texture(YES)
	else:
		var TP = get_node("TP")
		TP.set_texture(NOT)

func _on_TPArea_body_entered(body):
	if body.name == "TileMap":
		print(body.name)
		is_tileMap = true
		update()
	pass # Replace with function body.


func _on_TPArea_body_exited(_body):
	is_tileMap = false
	pass # Replace with function body.
