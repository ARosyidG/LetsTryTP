extends KinematicBody2D
var bulletCol
func _process(delta):
	move_and_slide(Vector2(-1200,0))
	for i in get_slide_count():
		bulletCol= get_slide_collision(i)
		if bulletCol:
			print("hilang")
			queue_free()
	pass
