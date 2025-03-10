class_name Camera
extends Node3D

const CAMERA_MAX_PITCH = deg_to_rad(70)
const CAMERA_MIN_PITCH = deg_to_rad(-89.9)
const CAMERA_RATIO = .625

@export var mouse_sensitivity: float = .002
@export var mouse_y_inversion: float = 1.0

@onready var _camera_yaw: Node3D = self
@onready var _camera_pitch: Node3D = %Camera3D
@onready var _camera:Camera3D = %Camera3D


var left:Vector3:
	get: 
		return -_camera.global_transform.basis.x

var right:Vector3:
	get:
		return _camera.global_transform.basis.x 

var forward:Vector3:
	get:
		return -_camera.global_transform.basis.z

var backward:Vector3:
	get:
		return _camera.global_transform.basis.z
		
var up:Vector3:
	get:
		return Vector3.UP
		
var down:Vector3:
	get:
		return Vector3.DOWN
		


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_camera(event.relative)
		get_viewport().set_input_as_handled()
		return


func rotate_camera(relative:Vector2) -> void:
	_camera_yaw.rotation.y -= relative.x * mouse_sensitivity
	_camera_yaw.orthonormalize()
	_camera_pitch.rotation.x += relative.y * mouse_sensitivity * CAMERA_RATIO * mouse_y_inversion 
	_camera_pitch.rotation.x = clamp(_camera_pitch.rotation.x, CAMERA_MIN_PITCH, CAMERA_MAX_PITCH)
