extends KinematicBody2D
var YES = preload("res://assets/TP_not.png")
var NOT = preload("res://assets/TP.png")
func _ready():
	pass
func _physics_process(delta):
	var kece = move_and_slide(Vector2(0,0))
	if is_tileMap()==true:
		var TP = get_node("TP")
		TP.set_texture(YES)
	else:
		var TP = get_node("TP")
		TP.set_texture(NOT)
func is_tileMap():
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider is TileMap:
			return true
