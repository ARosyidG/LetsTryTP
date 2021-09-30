extends KinematicBody2D
var bulletCol
export(int) var demage = 10
var bullet : bool = true
onready var Animplayer = $DuarAnim/AnimationPlayer
onready var duarAnim = $DuarAnim/bullet_Col
onready var Bulleta = $bullet
var stop = true
func _process(_delta):
	if stop:
		var _move = move_and_slide(Vector2(-1200,0))
		for i in get_slide_count():
			var collision = get_slide_collision(i)
			if collision:
				ngilang()
	
func ngilang():
	duarAnim.position = Bulleta.global_position
	stop = false
	Bulleta.hide()
	duarAnim.show()
	Animplayer.play("Duar")


func _on_AnimationPlayer_animation_finished(_anim_name):
	duarAnim.hide()
	queue_free()
	pass # Replace with function body.
