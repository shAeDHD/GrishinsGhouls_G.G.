extends CharacterBody3D


const SPEED = 3.0
const JUMP_VELOCITY = 4.5

@onready var camera_point = $camera_point

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var animation_player = $visuals/player/AnimationPlayer
@onready var visuals = $visuals

var walking = false

func _ready():
		GameManager.set_player(self)
		animation_player.set_blend_time("idle", "walk", 0.2)
		animation_player.set_blend_time("walk", "idle", 0.2)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		
		visuals.look_at(direction + position)
		
		if !walking:
			walking = true
			animation_player.play('walk')
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
		if walking:
			walking = false		
			animation_player.play('idle')			

	move_and_slide()
