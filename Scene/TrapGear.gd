extends Node2D
var demage = 15
var bullet : bool = false
func _process(delta):
	self.rotate(4*delta)
