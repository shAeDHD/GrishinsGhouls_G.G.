extends Node3D

@onready var background_viewport = $Camera3D/background_viewport_container/background_viewport
@onready var foreground_viewport = $Camera3D/foreground_viewport_container/foreground_viewport

@onready var background_camera = $Camera3D/background_viewport_container/background_viewport/background_camera
@onready var foreground_camera = $Camera3D/foreground_viewport_container/foreground_viewport/foreground_camera


# Called when the node enters the scene tree for the first time.
func _ready():
	resize()
	pass # Replace with function body.

func resize():
	background_viewport.size = DisplayServer.window_get_size()
	foreground_viewport.size = DisplayServer.window_get_size()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	background_camera.global_transform = GameManager.player.camera_point.global_transform
	foreground_camera.global_transform = GameManager.player.camera_point.global_transform	
	pass
