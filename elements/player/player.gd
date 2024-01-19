class_name Player
extends CharacterBody3D

@export var movement_speed: float = 10.0
@export var jump_speed: float = 2.0

## The animation player of this player
@onready var _animation_player:AnimationPlayer = %AnimationPlayer
## The actual player model.
@onready var _model:Node3D = %Model
## The camera
@onready var _camera:Camera = %Camera


func _physics_process(delta) -> void:
	if Input.get_mouse_mode() != Input.MOUSE_MODE_CAPTURED:
		# if we are currently in some UI mode, do not move the player.
		return
		
	var direction: Vector3 = get_camera_relative_input()
	var horizontal_velocity: Vector2 = Vector2(direction.x, direction.z) * movement_speed

	if Input.is_action_pressed("sprint"):
		horizontal_velocity *= 2
		
	if horizontal_velocity.length() > 0.1:
		# always look where the camera is looking (except up/down).
		var model_forward = -_model.global_transform.basis.z
		var camera_forward = _camera.forward * Vector3(1,0,1)
		_model.look_at(model_forward.lerp(camera_forward, 0.3) + global_position)

	velocity.x = horizontal_velocity.x
	velocity.z = horizontal_velocity.y
	velocity.y -= 40 * delta
		
	if Input.is_action_just_pressed("attack"):
		_animation_player.play("player_animations/Swing")
	
	move_and_slide()


# Returns the input vector relative to the camera. Forward is always the direction the camera is facing
func get_camera_relative_input() -> Vector3:
	var input_dir: Vector3 = Vector3.ZERO
	if Input.is_action_pressed("left"):
		input_dir += _camera.left
	if Input.is_action_pressed("right"):
		input_dir += _camera.right
	if Input.is_action_pressed("forward"):
		input_dir += _camera.forward
	if Input.is_action_pressed("backward"):
		input_dir += _camera.backward
	if Input.is_action_pressed("up"):
		velocity.y += jump_speed + movement_speed*.016
	if Input.is_action_pressed("down"):
		velocity.y -= jump_speed + movement_speed*.016
	return input_dir		


func _input(event: InputEvent) -> void:
	if event.is_action_released("down") or event.is_action_released("up"):
		velocity.y = 0



