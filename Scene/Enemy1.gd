extends KinematicBody2D
var getBullet = preload("res://Scene/Bullet.tscn")

onready var Reload = get_node("Reload")
var nembak: bool = true
var ada: bool = true
func _ready():
	Reload.set_wait_time(1)
	Reload.start()
func _process(delta):
	get_node("Enemy2").play("EnemyShot")
	pass
func _on_Reload_timeout():
	if nembak:
		get_node("Node2D").show()
		get_node("Node2D/gunSplashAnim").play("shot")
		
		var Bullet = getBullet.instance()
		Bullet.position=self.position
		get_parent().add_child(Bullet)
	
