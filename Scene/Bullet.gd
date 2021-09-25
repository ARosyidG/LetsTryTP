extends KinematicBody2D
var bulletCol
export(int) var demage = 1
var bullet : bool = true
func _process(delta):
	move_and_slide(Vector2(-1200,0))
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision:
			queue_free()
