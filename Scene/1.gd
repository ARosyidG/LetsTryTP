extends Player
var TP_scn = preload("res://Scene/TP_scn.tscn")
var TPtex = preload("res://assets/TP_not.png")
var TP_inh = TP_scn.instance()
var draw_area
var ada: bool = false
onready var health = $Control/CanvasLayer/Health
onready var recovery_time = $KENA/BIARBAGUS
onready var Kena = $KENA
func _physics_process(delta: float) -> void:
	var is_jump: = Input.is_action_just_released("Jump") and kecepatan.y < 0.0
	var arah: = dapat_arah()
	kecepatan = calculate_move_velocity(kecepatan, arah, speed, is_jump)
	kecepatan = move_and_slide(kecepatan, FLOOR_NORMAL)
	TP_inh.position = position.move_toward(get_global_mouse_position(),300)
func _ready():
	health.connect("depleted", self, "queue_free")
	pass
func dapat_arah() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("Move_left"),
		-1.0 if Input.get_action_strength("Jump") and is_on_floor() else 1.0
	)

func _draw():
	if draw_area:
		draw_arc(Vector2(0,0), 300, 0, deg2rad(360), 100, Color.aqua)
func _input(event):
	if Input.is_action_pressed("RMB"):
		draw_area = true
		update()
	else:
		draw_area = false
		update()
	if Input.is_action_just_pressed("RMB"):
		if not ada:
			get_parent().add_child(TP_inh)
			TP_inh.position = self.position
			ada = true
		
	if Input.is_action_just_released("RMB") and TP_inh.is_tileMap()!=true:
		if ada:
			self.position=TP_inh.position
			get_parent().remove_child(TP_inh)
			ada = false
	if Input.is_action_just_released("RMB") and TP_inh.is_tileMap()==true:
		if ada:
			get_parent().remove_child(TP_inh)
			ada = false


func calculate_move_velocity(
	kecepatan_linear: Vector2,
	arah : Vector2,
	speed : Vector2,
	is_jump: bool
) -> Vector2:
	var new_kecepatan: = kecepatan_linear
	new_kecepatan.x = speed.x * arah.x 
	new_kecepatan.y += gravity * get_physics_process_delta_time()
	if arah.y == -1.0:
		new_kecepatan.y = speed.y * arah.y
	if is_jump:
		new_kecepatan.y = 0.0
	return new_kecepatan
	



func _on_KENA_body_entered(body):
	health.current -= body.demage
	if body.bullet :
		body.queue_free()
	Kena.set_deferred("monitoring", false)
	recovery_time.start()
	pass # Replace with function body.



func _on_BIARBAGUS_timeout():
	Kena.set_deferred("monitoring", true)
	pass # Replace with function body.
