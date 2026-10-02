class_name BRPlayer extends RigidBody3D

var is_moving_forward : bool = false
var is_moving_back : bool = false
var is_moving_left : bool = false
var is_moving_right : bool = false

@export var overhead_cam : Camera3D

@export var first_person_cam : Camera3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if is_moving_forward:
		move_and_collide(0.1 * Vector3.FORWARD)
	if is_moving_back:
		move_and_collide(0.1 * Vector3.BACK)
	if is_moving_right:
		move_and_collide(0.1 * Vector3.RIGHT)
	if is_moving_left:
		move_and_collide(0.1 * Vector3.LEFT)

func _input(event: InputEvent) -> void:
	if not self.get_colliding_bodies().is_empty() and event.is_action_pressed("Jump"):
		apply_force(Vector3(0, 500, 0))
	
	if event.is_action_pressed("Move Forward"):
		is_moving_forward = true
	elif event.is_action_released("Move Forward"):
		is_moving_forward = false
	
	if event.is_action_pressed("Move Backward"):
		is_moving_back = true
	elif event.is_action_released("Move Backward"):
		is_moving_back = false

	if event.is_action_pressed("Move Left"):
		is_moving_left = true
	elif event.is_action_released("Move Left"):
		is_moving_left = false

	if event.is_action_pressed("Move Right"):
		is_moving_right = true
	elif event.is_action_released("Move Right"):
		is_moving_right = false
	
	if event.is_action_pressed("Swap Camera"):
		overhead_cam.current = not overhead_cam.current
		first_person_cam.current = not overhead_cam.current
