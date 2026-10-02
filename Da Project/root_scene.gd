extends Node3D

var starting_transform : Transform3D
@export var player : RigidBody3D
@export var reset_burton : Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset_burton.pressed.connect(on_burton_pursed)
	starting_transform = player.transform

func on_burton_pursed() -> void:
	player.linear_velocity = Vector3.ZERO
	player.angular_velocity = Vector3.ZERO
	
	PhysicsServer3D.body_set_state(
	player.get_rid(),
	PhysicsServer3D.BODY_STATE_TRANSFORM,
	Transform3D.IDENTITY.translated(starting_transform.origin))
	reset_burton.release_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
